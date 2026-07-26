# Space Zap Disassembly (coin-op arcade game)

This disassembly was started by myself a LONG, LONG time ago. There is much to write in this README file but it will have to wait as I have other obligations at the moment.
It is a extrememly "bare bones" with no comments and the last update was about 2008! In my work directories from that long ago I do have a listing file from where I compiled it but I don't know if it runs. 

Please note that this code was formatted to be compiled with TASM, so it may take a bit of conversion to get it to compile with ZMAC.

This README.md file will be updated with more details later.

-Commander Dave 08/26/2024

## 🛠️ Build & Tools

* **Assembler:** [zmac v1.3](https://ballyalley.com/ml/ml_tools/Zmac13_win32.zip) (Z80 Macro Cross Assembler)
* **Primary Source:** `/Space_Zap_Disassembly.asm`

### Building the ROMs ---> Linux

The Linux build requires Bash, `zip`, and a Linux build of `zmac`. The build script searches for `zmac` in the following order:

1. The executable named by the `ZMAC` environment variable.
2. `tools/zmac` in the repository.
3. `zmac` in `PATH`.

From the repository root, make the script executable once and run it:

```bash
chmod +x build.sh
./build.sh
```

To select a specific assembler executable:

```bash
ZMAC=/path/to/zmac ./build.sh
```

The script will automatically compile the assembly and deposit the final, ready-to-play binaries (`0662.01.bin` through `0665.xx`) and the packaged spacezap.zip into the `roms/` folder in your project root.

---

## Repository Structure

```text
|-- roms/                   # ROM images and generated zip
|   |-- 0662.01 ... 0665.xx
|   |-- spacezap.zip
|-- zout/               # zmac build output
|-- Space_Zap_Disassembly.asm
|-- build.sh                # Linux ROM build script
|-- README.md               # Game-specific overview (this file)
`-- .gitignore
```
