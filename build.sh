#!/usr/bin/env bash
set -euo pipefail

readonly ROM_SIZE=$((0x1000))
readonly SOURCE_NAME="Space_Zap_Disassembly.asm"
readonly ZIP_NAME="spacezap.zip"

readonly REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly SOURCE_DIR="$REPO_ROOT/"
readonly BUILD_DIR="$SOURCE_DIR/zout"
readonly ROMS_DIR="$REPO_ROOT/roms"
readonly SOURCE_FILE="$SOURCE_DIR/$SOURCE_NAME"
readonly SOURCE_STEM="${SOURCE_NAME%.asm}"
readonly CIM_FILE="$BUILD_DIR/$SOURCE_STEM.cim"
readonly LST_FILE="$BUILD_DIR/$SOURCE_STEM.lst"
readonly ZIP_FILE="$ROMS_DIR/$ZIP_NAME"

readonly -a ROM_NAMES=(
  "0662.01"
  "0663.xx"
  "0664.xx"
  "0665.xx"
)

readonly -a ROM_ADDRESSES=(
  0x0000
  0x1000
  0x2000
  0x3000
)

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

require_command() {
  command -v "$1" >/dev/null 2>&1 ||
    fail "Required command not found: $1"
}

resolve_zmac() {
  local candidate

  if [[ -n "${ZMAC:-}" ]]; then
    if [[ "$ZMAC" == */* ]]; then
      [[ -x "$ZMAC" ]] || fail "ZMAC is not executable: $ZMAC"
      printf '%s\n' "$ZMAC"
    else
      candidate="$(command -v "$ZMAC" 2>/dev/null)" ||
        fail "ZMAC command not found: $ZMAC"
      printf '%s\n' "$candidate"
    fi
    return
  fi

  candidate="$REPO_ROOT/tools/zmac"
  if [[ -x "$candidate" ]]; then
    printf '%s\n' "$candidate"
    return
  fi

  candidate="$(command -v zmac 2>/dev/null)" ||
    fail "zmac was not found. Install it in PATH, place it at tools/zmac, or set ZMAC=/path/to/zmac."
  printf '%s\n' "$candidate"
}

prepare_output_directories() {
  local rom_name

  rm -rf -- "$BUILD_DIR"
  mkdir -p -- "$BUILD_DIR" "$ROMS_DIR"

  for rom_name in "${ROM_NAMES[@]}"; do
    rm -f -- "$ROMS_DIR/$rom_name"
  done
  rm -f -- "$ZIP_FILE"
}

assemble_source() {
  log "[2/4] Assembling $SOURCE_NAME"
  log "      zmac: $ZMAC_BIN"

  (
    cd -- "$SOURCE_DIR"
    "$ZMAC_BIN" --oo cim,lst "$SOURCE_NAME"
  ) || fail "zmac failed. Review the assembler output above."

  [[ -s "$CIM_FILE" ]] ||
    fail "zmac did not create $CIM_FILE"
  [[ -s "$LST_FILE" ]] ||
    fail "zmac did not create $LST_FILE"

  log "      image:   $CIM_FILE ($(stat -c '%s bytes' "$CIM_FILE"))"
  log "      listing: $LST_FILE"
}

slice_roms() {
  local cim_size
  local index
  local rom_name
  local start_address
  local end_address
  local output_file
  local output_size

  cim_size="$(stat -c '%s' "$CIM_FILE")"
  (( cim_size >= ROM_ADDRESSES[${#ROM_ADDRESSES[@]} - 1] + ROM_SIZE )) ||
    fail "Assembled image is too short for the Space Zap ROM map: $cim_size bytes"

  log "[3/4] Splitting the CPU image into four 4 KiB Space Zap ROMs"

  for index in "${!ROM_NAMES[@]}"; do
    rom_name="${ROM_NAMES[$index]}"
    start_address="${ROM_ADDRESSES[$index]}"
    end_address=$((start_address + ROM_SIZE - 1))
    output_file="$ROMS_DIR/$rom_name"

    # Pre-fill each socket image so a partially populated final block has the
    # same erased-byte value as the Windows Intel HEX slicer.
    dd if=/dev/zero bs="$ROM_SIZE" count=1 status=none |
      tr '\000' '\377' > "$output_file"

    dd if="$CIM_FILE" of="$output_file" \
      bs="$ROM_SIZE" skip="$((start_address / ROM_SIZE))" count=1 \
      conv=notrunc status=none

    output_size="$(stat -c '%s' "$output_file")"
    (( output_size == ROM_SIZE )) ||
      fail "$rom_name is $output_size bytes; expected $ROM_SIZE"

    printf '      %-12s CPU $%04X-$%04X  %5d bytes\n' \
      "$rom_name" "$start_address" "$end_address" "$output_size"
  done
}

create_zip() {
  local rom_name
  local -a zip_inputs=()

  for rom_name in "${ROM_NAMES[@]}"; do
    zip_inputs+=("$ROMS_DIR/$rom_name")
  done

  (
    cd -- "$ROMS_DIR"
    zip -q -j -X "$ZIP_FILE" "${zip_inputs[@]}"
  ) || fail "Could not create $ZIP_FILE"

  [[ -s "$ZIP_FILE" ]] || fail "ZIP archive was not created: $ZIP_FILE"
  log "      archive: $ZIP_FILE ($(stat -c '%s bytes' "$ZIP_FILE"))"
}

main() {
  local ZMAC_BIN

  [[ -f "$SOURCE_FILE" ]] || fail "Source file not found: $SOURCE_FILE"

  require_command dd
  require_command stat
  require_command tr
  require_command zip
  ZMAC_BIN="$(resolve_zmac)"

  log "Space Zap ROM build"
  log "  source: $SOURCE_FILE"
  log "  output: $ROMS_DIR"
  log

  log "[1/4] Preparing clean build and ROM output"
  prepare_output_directories
  assemble_source
  slice_roms

  log "[4/4] Creating $ZIP_NAME"
  create_zip

  log
  log "Build complete."
  log "  ROM files: $ROMS_DIR/{0662.01,0663.xx,0664.xx,0665.xx}"
  log "  MAME ZIP:  $ZIP_FILE"
}

main "$@"
