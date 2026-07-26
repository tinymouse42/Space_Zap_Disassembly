;*****************************
; Space Zap
;*****************************
;
; Sprite object record
; --------------------
;   +0  Horizontal hotspot offset
;   +1  Vertical hotspot offset
;   +2  Bitmap width in bytes
;   +3  Bitmap height in rows
;   +4  Packed 2bpp bitmap data
;
; Each bitmap byte stores four pixels, most-significant pair first. The shared
; object draw path advances past the two hotspot bytes before reading the
; width/height header.
; Inline pixels use "." for value 0 and "1" through "3" for the color index.
;
	 .ORG 0000H

	 nop
	 nop
	 di
	 jp   $0015
	 nop
	 nop
	 dec  ix
	 ld   (ix+$00),b
	 dec  ix
	 ld   (ix+$00),c
	 pop  bc
	 jp   (iy)
	 ld   a,$01
	 out  ($08),a
	 ld   a,$F0
	 out  ($F8),a
	 ld   a,$0F
	 out  ($FA),a
	 out  ($FB),a
	 ld   a,$01
	 out  ($FF),a
	 ld   ix,$D800
	 ld   sp,$D780
	 ld   bc,$3CDC
	 ld   iy,$0035
	 ld   a,(bc)
	 inc  bc
	 ld   de,$3DEA
	 ld   l,a
	 ld   h,$00
	 add  hl,hl
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 jp   (hl)
	 ld   c,(ix+$00)
	 inc  ix
	 ld   b,(ix+$00)
	 inc  ix
	 jp   (iy)
	 ld   a,(bc)
	 inc  bc
	 ld   l,a
	 ld   a,(bc)
	 inc  bc
	 ld   h,a
	 push hl
	 jp   (iy)
	 ld   a,(bc)
	 inc  bc
	 ld   l,a
	 ld   h,$00
	 push hl
	 jp   (iy)
	 ld   a,(bc)
	 inc  bc
	 ld   l,a
	 ld   a,(bc)
	 inc  bc
	 ld   h,a
	 push hl
	 jp   $0050
	 pop  hl
	 ld   a,(bc)
	 inc  bc
	 ld   e,a
	 ld   a,(bc)
	 inc  bc
	 ld   d,a
	 add  hl,de
	 push hl
	 jp   (iy)
	 pop  hl
	 add  hl,hl
	 jp   $006C
	 ld   hl,$0000
	 push hl
	 jp   (iy)
	 ld   hl,$0001
	 push hl
	 jp   (iy)
	 pop  hl
	 push hl
	 push hl
	 jp   (iy)
	 pop  hl
	 pop  de
	 push de
	 push hl
	 push de
	 push hl
	 jp   (iy)
	 pop  hl
	 jp   (iy)
	 pop  hl
	 pop  de
	 push hl
	 push de
	 jp   (iy)
	 pop  hl
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 push de
	 jp   (iy)
	 pop  hl
	 ld   e,(hl)
	 ld   d,$00
	 push de
	 jp   (iy)
	 pop  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 pop  de
	 ld   (hl),e
	 jp   (iy)
	 pop  hl
	 ld   (hl),$00
	 inc  hl
	 ld   (hl),$00
	 jp   (iy)
	 pop  de
	 pop  hl
	 add  hl,de
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 xor  a
	 sbc  hl,de
	 push hl
	 jp   (iy)
	 pop  de
	 ld   hl,$0000
	 jp   $00C7
	 pop  hl
	 dec  hl
	 push hl
	 jp   (iy)
	 pop  hl
	 inc  hl
	 push hl
	 jp   (iy)
	 pop  hl
	 sra  h
	 rr   l
	 push hl
	 jp   (iy)
	 pop  hl
	 dec  (hl)
	 jp   (iy)
	 pop  hl
	 inc  (hl)
	 jp   (iy)
	 pop  de
	 pop  hl
	 xor  a
	 sbc  hl,de
	 ld   hl,$0000
	 jp   nz,$00FA
	 inc  hl
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 xor  a
	 sbc  hl,de
	 ld   hl,$0000
	 jp   c,$0109
	 inc  hl
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 xor  a
	 sbc  hl,de
	 ld   de,$0000
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   pe,$011D
	 inc  de
	 push de
	 jp   (iy)
	 pop  de
	 pop  hl
	 xor  a
	 sbc  hl,de
	 ld   de,$0000
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$0131
	 inc  de
	 push de
	 jp   (iy)
	 pop  hl
	 pop  de
	 jp   $010E
	 ld   de,$0000
	 jp   $00EF
	 pop  hl
	 ld   a,l
	 or   h
	 jp   z,$0146
	 push hl
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 ld   a,l
	 and  e
	 ld   l,a
	 ld   a,h
	 and  d
	 ld   h,a
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 ld   a,l
	 or   e
	 ld   l,a
	 ld   a,h
	 or   d
	 ld   h,a
	 push hl
	 jp   (iy)
	 exx
	 pop  bc
	 pop  de
	 pop  hl
	 ld   a,b
	 or   c
	 jp   z,$016A
	 ldir
	 exx
	 jp   (iy)
	 ld   de,$FFFA
	 add  ix,de
	 pop  hl
	 pop  de
	 ld   (ix+$00),l
	 ld   (ix+$01),h
	 ld   (ix+$02),e
	 ld   (ix+$03),d
	 ld   (ix+$04),c
	 ld   (ix+$05),b
	 jp   (iy)
	 ld   l,(ix+$00)
	 ld   h,(ix+$01)
	 inc  hl
	 ld   (ix+$00),l
	 ld   (ix+$01),h
	 ld   e,(ix+$02)
	 ld   d,(ix+$03)
	 xor  a
	 sbc  hl,de
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$01AE
	 ld   de,$0006
	 add  ix,de
	 jp   $01B4
	 ld   c,(ix+$04)
	 ld   b,(ix+$05)
	 jp   (iy)
	 ld   l,(ix+$00)
	 ld   h,(ix+$01)
	 push hl
	 jp   (iy)
	 pop  hl
	 pop  de
	 push de
	 push hl
	 push de
	 jp   (iy)
	 pop  hl
	 pop  de
	 ld   a,(hl)
	 add  a,e
	 ld   (hl),a
	 inc  hl
	 ld   a,(hl)
	 adc  a,d
	 ld   (hl),a
	 jp   (iy)
	 exx
	 pop  bc
	 pop  hl
	 out  (c),l
	 exx
	 jp   (iy)
	 exx
	 pop  bc
	 in   l,(c)
	 ld   h,$00
	 push hl
	 exx
	 jp   (iy)
	 pop  de
	 pop  hl
	 ex   (sp),hl
	 push de
	 push hl
	 jp   (iy)
	 pop  hl
	 dec  hl
	 add  hl,hl
	 add  hl,sp
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 push de
	 jp   (iy)
	 ld   a,(bc)
	 ld   e,a
	 inc  bc
	 ld   a,(bc)
	 ld   b,a
	 ld   c,e
	 jp   (iy)
	 pop  hl
	 ld   a,h
	 or   l
	 jp   z,$0206
	 inc  bc
	 inc  bc
	 jp   (iy)
	 jp   $01F4
	 ld   a,(ix+$00)
	 ld   (ix+$02),a
	 ld   a,(ix+$01)
	 ld   (ix+$03),a
	 jp   (iy)
	 rst  $08
	 ld   bc,$0302
	 ld   e,$02
	 inc  b
	 dec  b
	 ld   b,$CF
	 ld   bc,$0307
	 daa
	 ld   (bc),a
	 inc  b
	 dec  b
	 ld   b,$E1
	 pop  de
	 or   a
	 sbc  hl,de
	 jp   nz,$0235
	 inc  bc
	 inc  bc
	 jp   (iy)
	 ld   a,(bc)
	 ld   l,a
	 inc  bc
	 ld   a,(bc)
	 ld   b,a
	 ld   c,l
	 push de
	 jp   (iy)
	 ld   a,(bc)
	 ld   e,a
	 inc  bc
	 ld   a,(bc)
	 ld   d,a
	 inc  bc
	 pop  hl
	 sla  l
	 rl   h
	 add  hl,bc
	 ld   b,d
	 ld   c,e
	 ex   de,hl
	 or   a
	 sbc  hl,de
	 jp   c,$025C
	 jp   z,$025C
	 ld   a,(de)
	 ld   l,a
	 inc  de
	 ld   a,(de)
	 ld   h,a
	 jp   (hl)
	 jp   (iy)
	 rst  $08
	 inc  b
	 ex   af,af'
	 ld   b,$CF
	 add  hl,bc
	 ld   a,(bc)
	 ld   b,$CF
	 dec  bc
	 ld   a,(bc)
	 ld   b,$F5
	 ld   a,h
	 cpl
	 ld   h,a
	 ld   a,l
	 cpl
	 ld   l,a
	 inc  hl
	 pop  af
	 ret
	 push af
	 ld   a,d
	 cpl
	 ld   d,a
	 ld   a,e
	 cpl
	 ld   e,a
	 inc  de
	 pop  af
	 ret
	 rst  $08
	 inc  c
	 dec  c
	 ld   c,$04
	 rrca
	 inc  b
	 ld   bc,$0E10
	 ld   (bc),a
	 rrca
	 djnz $0292
	 ld   a,i
	 push af
	 di
	 push de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 push de
	 pop  iy
	 inc  hl
	 ld   c,(iy+$00)
	 ld   e,c
	 ld   b,(iy+$01)
	 ld   d,b
	 ld   a,(hl)
	 inc  hl
	 cp   c
	 jp   nz,$02A8
	 ld   a,(hl)
	 cp   b
	 jp   nz,$02B0
	 push iy
	 pop  bc
	 inc  bc
	 inc  bc
	 inc  bc
	 inc  bc
	 ld   a,(iy+$02)
	 cp   c
	 ld   a,(iy+$03)
	 jp   nz,$02BD
	 cp   b
	 jp   nz,$02CA
	 pop  de
	 ld   hl,$0001
	 pop  af
	 jp   po,$02C9
	 ei
	 ret
	 pop  hl
	 ld   a,l
	 ld   (de),a
	 inc  de
	 ld   a,h
	 ld   (de),a
	 ld   (iy+$00),c
	 ld   (iy+$01),b
	 ld   hl,$0000
	 pop  af
	 jp   po,$02DE
	 ei
	 ret
	 ld   a,i
	 push af
	 di
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 push de
	 pop  iy
	 inc  hl
	 ld   c,(iy+$02)
	 ld   b,(iy+$03)
	 ld   a,(iy+$00)
	 cp   c
	 jp   nz,$02FB
	 ld   a,(iy+$01)
	 cp   b
	 jp   nz,$0307
	 ld   hl,$0001
	 pop  af
	 jp   po,$0306
	 ei
	 ret
	 ld   a,(bc)
	 ld   e,a
	 inc  bc
	 ld   a,(bc)
	 ld   d,a
	 dec  bc
	 ld   a,(hl)
	 inc  hl
	 cp   c
	 jp   nz,$0315
	 ld   a,(hl)
	 cp   b
	 jp   nz,$031D
	 push iy
	 pop  bc
	 inc  bc
	 inc  bc
	 inc  bc
	 inc  bc
	 ld   (iy+$02),c
	 ld   (iy+$03),b
	 ld   hl,$0000
	 pop  af
	 jp   po,$032D
	 ei
	 ret
	 di
	 add  a,$09
	 out  ($00),a
	 jp   $032E
	 and  c
	 ret  nc
	 rst  $10
	 ret  nc
	 exx
	 ret  nc
	 rrca
	 pop  de
	 ld   de,$2FD1
	 pop  de
	 ld   sp,$4FD1
	 pop  de
	 ld   hl,$0336
	 ld   a,$01
	 push iy
	 ld   ($D09E),a
	 push iy
	 pop  de
	 call $028C
	 ld   a,l
	 or   h
	 jp   z,$035F
	 ld   hl,($D09F)
	 jp   (hl)
	 pop  iy
	 ret
	 ld   hl,$D093
	 inc  (hl)
	 ld   hl,$033A
	 ld   a,$02
	 jp   $034B
	 ld   a,(iy+$0a)
	 cp   $01
	 ret  nc
	 inc  (iy+$0a)
	 ld   hl,$D095
	 inc  (hl)
	 ld   a,($D08F)
	 cp   (iy+$1f)
	 jp   nc,$038C
	 ld   a,$04
	 ld   hl,$0342
	 jp   $0391
	 ld   a,$03
	 ld   hl,$033E
	 jp   $034B
	 push bc
	 ld   a,($D08E)
	 out  ($00),a
	 ei
	 ld   a,($D097)
	 or   a
	 jp   z,$03AA
	 di
	 xor  a
	 ld   ($D097),a
	 pop  bc
	 jp   (iy)
	 ld   ($D09C),sp
	 ld   ($D09A),ix
	 ld   hl,$0336
	 push iy
	 call $02DF
	 pop  iy
	 ld   a,l
	 or   h
	 jp   nz,$0407
	 ld   ($D098),de
	 push de
	 ex   (sp),iy
	 ld   a,(iy+$0a)
	 or   a
	 jp   nz,$0402
	 ld   bc,$040A
	 dec  ix
	 ld   (ix+$00),b
	 dec  ix
	 ld   (ix+$00),c
	 ld   a,($D08D)
	 out  ($00),a
	 bit  0,(iy+$04)
	 jp   z,$03F5
	 ld   c,(iy+$00)
	 ld   b,(iy+$01)
	 res  0,(iy+$04)
	 jp   $03FB
	 ld   c,(iy+$02)
	 ld   b,(iy+$03)
	 pop  iy
	 jp   (iy)
	 jp   $0407
	 call $0346
	 pop  iy
	 jp   $0422
	 ld   (de),a
	 push iy
	 ld   iy,($D098)
	 bit  2,(iy+$04)
	 jp   nz,$041C
	 res  1,(iy+$04)
	 set  0,(iy+$04)
	 pop  iy
	 ld   sp,($D09C)
	 ld   ix,($D09A)
	 pop  bc
	 jp   $0394
	 and  l
	 ex   (sp),iy
	 ld   (iy+$01),b
	 ld   (iy+$00),c
	 ld   a,(iy+$04)
	 bit  1,a
	 jp   z,$0442
	 cpl
	 bit  3,a
	 jp   nz,$044F
	 call $0346
	 ld   a,($D089)
	 dec  a
	 ld   (iy+$0b),a
	 ld   (iy+$04),$00
	 set  1,(iy+$04)
	 set  0,(iy+$04)
	 push iy
	 pop  hl
	 ld   de,($D098)
	 or   a
	 sbc  hl,de
	 jp   nz,$0470
	 call $0346
	 pop  iy
	 jp   $0422
	 pop  iy
	 ld   c,(ix+$00)
	 inc  ix
	 ld   b,(ix+$00)
	 inc  ix
	 jp   (iy)
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$02),c
	 ld   (iy+$03),b
	 call $0346
	 pop  iy
	 jp   $0422
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$02),c
	 ld   (iy+$03),b
	 call $0362
	 pop  iy
	 jp   $0422
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$02),c
	 ld   (iy+$03),b
	 set  3,(iy+$04)
	 pop  iy
	 jp   $0422
	 ex   (sp),iy
	 push bc
	 bit  3,(iy+$04)
	 jp   z,$04D3
	 call $0346
	 ld   a,($D089)
	 dec  a
	 ld   (iy+$0b),a
	 res  3,(iy+$04)
	 pop  bc
	 pop  iy
	 jp   (iy)
	 push af
	 push bc
	 push de
	 push hl
	 exx
	 ex   af,af'
	 push af
	 push bc
	 push de
	 push hl
	 push iy
	 push ix
	 ld   a,($D086)
	 out  ($0F),a
	 ld   a,$D0
	 ld   i,a
	 ld   a,$80
	 out  ($0D),a
	 ld   hl,$D089
	 inc  (hl)
	 ld   a,($D091)
	 cp   $00
	 jp   nz,$05D5
	 ld   a,$01
	 ei
	 ld   ($D091),a
	 xor  a
	 ld   ($D096),a
	 ld   a,($D091)
	 cp   $01
	 jp   nz,$0520
	 ld   a,($D096)
	 or   a
	 jp   nz,$0520
	 ld   hl,$033E
	 call $02DF
	 ld   a,l
	 or   h
	 jp   nz,$0547
	 ld   hl,$D095
	 dec  (hl)
	 push de
	 pop  iy
	 dec  (iy+$0a)
	 ld   hl,$053E
	 push hl
	 ld   h,(iy+$09)
	 ld   l,(iy+$08)
	 ld   a,($D08A)
	 out  ($00),a
	 di
	 jp   (hl)
	 ei
	 ld   a,($D08E)
	 out  ($00),a
	 jp   $0509
	 di
	 ld   a,($D090)
	 cp   $00
	 jp   nz,$05CF
	 ld   a,$01
	 ei
	 ld   ($D090),a
	 xor  a
	 ld   ($D094),a
	 ld   a,($D090)
	 cp   $01
	 jp   nz,$057B
	 ld   a,($D093)
	 ld   b,a
	 ld   a,($D094)
	 cp   b
	 jp   nc,$0578
	 ld   hl,$033A
	 call $02DF
	 ld   a,l
	 or   h
	 jp   $057B
	 ld   a,$01
	 or   a
	 jp   nz,$05CA
	 push de
	 pop  iy
	 ld   hl,$D093
	 dec  (hl)
	 ld   hl,$D094
	 inc  (hl)
	 bit  2,(iy+$04)
	 jp   z,$0594
	 xor  a
	 jp   $0598
	 bit  0,(iy+$04)
	 jp   z,$05A1
	 call $0346
	 jp   $05C7
	 ld   a,($D08C)
	 out  ($00),a
	 ld   a,($D089)
	 sub  (iy+$0b)
	 jp   z,$05BE
	 ld   hl,$05C1
	 push hl
	 ld   h,(iy+$07)
	 ld   l,(iy+$06)
	 di
	 jp   (hl)
	 jp   $05C1
	 call $0362
	 ei
	 ld   a,($D08E)
	 out  ($00),a
	 jp   $055A
	 ld   a,$00
	 ld   ($D090),a
	 di
	 ld   a,$00
	 ld   ($D091),a
	 pop  ix
	 pop  iy
	 pop  hl
	 pop  de
	 pop  bc
	 pop  af
	 ex   af,af'
	 exx
	 pop  hl
	 pop  de
	 pop  bc
	 pop  af
	 ei
	 ret
	 di
	 ld   a,$08
	 out  ($0E),a
	 im   2
	 call $04D8
	 di
	 jp   (iy)
	 push af
	 push bc
	 push de
	 push hl
	 exx
	 ex   af,af'
	 push af
	 push bc
	 push de
	 push hl
	 push iy
	 push ix
	 ld   a,($D087)
	 out  ($0F),a
	 ld   a,$D0
	 ld   i,a
	 ld   a,$82
	 out  ($0D),a
	 ld   a,($D091)
	 cp   $01
	 jp   nz,$061A
	 ld   a,$02
	 ld   ($D091),a
	 ld   a,($D092)
	 cp   $00
	 jp   nz,$0670
	 ld   a,$01
	 ei
	 ld   ($D092),a
	 xor  a
	 ld   ($D096),a
	 ld   a,($D092)
	 cp   $01
	 jp   nz,$0643
	 ld   a,($D096)
	 or   a
	 jp   nz,$0643
	 ld   hl,$0342
	 call $02DF
	 ld   a,l
	 or   h
	 jp   nz,$066A
	 ld   hl,$D095
	 dec  (hl)
	 push de
	 pop  iy
	 dec  (iy+$0a)
	 ld   hl,$0661
	 push hl
	 ld   h,(iy+$09)
	 ld   l,(iy+$08)
	 ld   a,($D08B)
	 out  ($00),a
	 di
	 jp   (hl)
	 ei
	 ld   a,($D08E)
	 out  ($00),a
	 jp   $062C
	 di
	 ld   a,$00
	 ld   ($D092),a
	 jp   $05D5
	 push af
	 ld   a,($D088)
	 out  ($0F),a
	 ld   a,$D0
	 ld   i,a
	 ld   a,$84
	 out  ($0D),a
	 ld   a,($D092)
	 cp   $01
	 jp   nz,$068E
	 ld   a,$02
	 ld   ($D092),a
	 ld   a,($D090)
	 cp   $01
	 jp   nz,$069B
	 ld   a,$02
	 ld   ($D090),a
	 pop  af
	 ei
	 ret
;*******************************************************************************
; MAGIC_DRAW_BITMAP
;
; Configures and starts a Magic/DNA bitmap transfer.
;
; Input:
;   B  XPAND value
;   C  Magic control and transform flags
;   D  Bitmap height in rows
;   E  Bitmap width in bytes
;   HL Destination address
;   IX Source bitmap address
;
; Bit 2 is cleared before the Magic register write. Bits 6 and 7 select the
; horizontal and vertical hardware transforms used by Space Zap.
;*******************************************************************************
MAGIC_DRAW_BITMAP:
	 ld   a,b
	 out  ($19),a
	 ld   a,c
	 res  2,a
	 out  ($0C),a
	 ld   a,$24
	 bit  7,c
	 jp   z,$06AF
	 set  4,a
	 bit  6,c
	 jp   z,$06B6
	 res  5,a
	 bit  3,c
	 jp   z,$06BD
	 set  1,a
	 bit  2,c
	 jp   z,$06C7
	 inc  e
	 res  2,a
	 set  3,a
	 ld   b,a
	 out  ($7A),a
	 push hl
	 push ix
	 pop  hl
	 ld   a,l
	 out  ($78),a
	 ld   a,h
	 out  ($79),a
	 pop  hl
	 ld   a,l
	 out  ($7B),a
	 ld   a,h
	 out  ($7C),a
	 ld   h,e
	 bit  3,c
	 jp   z,$06E3
	 rlc  h
	 dec  h
	 bit  7,c
	 jp   z,$06FA
	 bit  6,c
	 jp   z,$06F4
	 ld   a,$B0
	 add  a,h
	 jp   $06F7
	 ld   a,$B0
	 sub  h
	 jp   $0708
	 bit  6,c
	 jp   z,$0705
	 ld   a,$50
	 add  a,h
	 jp   $0708
	 ld   a,$50
	 sub  h
	 out  ($7B),a
	 ld   a,h
	 out  ($7D),a
	 ld   a,d
	 dec  a
	 out  ($7E),a
	 ret
;*******************************************************************************
; DRAW_SPRITE_FROM_HEADER
;
; Reads the width and height at IX, advances IX to the packed bitmap, and enters
; MAGIC_DRAW_BITMAP. Object-record callers pass object address + 2.
;*******************************************************************************
DRAW_SPRITE_FROM_HEADER:
	 ld   e,(ix+$00)
	 inc  ix
	 ld   d,(ix+$00)
	 inc  ix
	 jp   MAGIC_DRAW_BITMAP
	 sla  l
	 rl   h
	 sla  l
	 rl   h
	 ld   a,h
	 ld   h,$00
	 ld   l,a
	 add  hl,hl
	 add  hl,hl
	 add  hl,hl
	 add  hl,hl
	 push de
	 ld   e,l
	 ld   d,h
	 add  hl,hl
	 add  hl,hl
	 add  hl,de
	 ex   de,hl
	 pop  hl
	 ld   a,l
	 ld   l,h
	 ld   h,$00
	 add  hl,de
	 rlca
	 rlca
	 and  $03
	 ret
	 bit  6,c
	 jp   z,$074C
	 neg
	 jp   nz,$074C
	 dec  hl
	 and  $03
	 ld   e,a
	 ld   a,c
	 and  $FC
	 or   e
	 ld   c,a
	 ret
; Draw the object referenced by the active actor state and preserve its render
; parameters for the corresponding erase/redraw operation.
DRAW_ACTIVE_OBJECT:
	 ld   b,(iy+$1b)
	 ld   (iy+$23),b
	 ld   c,(iy+$1a)
	 ld   (iy+$22),c
	 ld   h,(iy+$21)
	 ld   l,(iy+$20)
	 ld   (iy+$37),h
	 ld   (iy+$36),l
	 inc  hl
	 inc  hl
	 push hl
	 pop  ix
	 ld   h,(iy+$39)
	 ld   l,(iy+$38)
	 ld   (iy+$3b),h
	 ld   (iy+$3a),l
	 jp   DRAW_SPRITE_FROM_HEADER

; Redraw the object using the render parameters saved by DRAW_ACTIVE_OBJECT.
REDRAW_SAVED_OBJECT:
	 ld   b,(iy+$23)
	 ld   c,(iy+$22)
	 ld   h,(iy+$37)
	 ld   l,(iy+$36)
	 inc  hl
	 inc  hl
	 push hl
	 pop  ix
	 ld   h,(iy+$3b)
	 ld   l,(iy+$3a)
	 jp   DRAW_SPRITE_FROM_HEADER
	 bit  3,(iy+$24)
	 jp   nz,$07B1
	 ld   a,(iy+$37)
	 or   (iy+$36)
	 jp   z,$07AE
	 call REDRAW_SAVED_OBJECT
	 jp   $07B5
	 res  3,(iy+$24)
	 bit  1,(iy+$24)
	 jp   nz,$07D5
	 in   a,($08)
	 call $0755
	 bit  0,(iy+$0f)
	 jp   z,$07D2
	 in   a,($08)
	 and  a
	 jp   z,$07D2
	 set  1,(iy+$11)
	 jp   $07D9
	 res  1,(iy+$24)
	 ret
	 sla  l
	 rl   h
	 sla  l
	 rl   h
	 ld   b,(iy+$21)
	 ld   c,(iy+$20)
	 push bc
	 pop  ix
	 ld   c,(iy+$1a)
	 push hl
	 ex   de,hl
	 ld   d,(ix+$00)
	 ld   e,$00
	 sra  d
	 rr   e
	 sra  d
	 rr   e
	 bit  6,c
	 jp   z,$0806
	 add  hl,de
	 jp   $0809
	 or   a
	 sbc  hl,de
	 ex   (sp),hl
	 ld   d,(ix+$01)
	 ld   e,$00
	 bit  7,c
	 jp   z,$0819
	 add  hl,de
	 dec  hl
	 jp   $081C
	 or   a
	 sbc  hl,de
	 pop  de
	 ld   a,h
	 ld   h,$00
	 ld   l,a
	 add  hl,hl
	 add  hl,hl
	 add  hl,hl
	 add  hl,hl
	 push de
	 ld   e,l
	 ld   d,h
	 add  hl,hl
	 add  hl,hl
	 add  hl,de
	 ex   de,hl
	 pop  hl
	 ld   a,l
	 ld   l,h
	 ld   h,$00
	 add  hl,de
	 rlca
	 rlca
	 and  $03
	 bit  6,c
	 jp   z,$0841
	 neg
	 jp   nz,$0841
	 dec  hl
	 and  $03
	 ld   e,a
	 ld   a,c
	 and  $FC
	 or   e
	 ld   (iy+$1a),a
	 ld   (iy+$39),h
	 ld   (iy+$38),l
	 ret
	 ld   a,(iy+$0d)
	 sub  b
	 ld   (iy+$0d),a
	 ld   a,(iy+$0e)
	 sbc  a,$00
	 ld   (iy+$0e),a
	 ld   b,(iy+$0c)
	 xor  a
	 add  a,c
	 djnz $0865
	 add  a,(iy+$0b)
	 ld   (iy+$0b),a
	 bit  4,(iy+$24)
	 jp   nz,$08F3
	 bit  5,(iy+$0f)
	 jp   nz,$08F3
	 bit  0,(iy+$24)
	 jp   nz,$08DE
	 ld   a,(iy+$36)
	 xor  (iy+$20)
	 jp   nz,$08DE
	 ld   a,(iy+$37)
	 xor  (iy+$21)
	 jp   nz,$08DE
	 exx
	 ld   d,(iy+$27)
	 ld   e,(iy+$26)
	 ld   h,(iy+$2f)
	 ld   l,(iy+$2e)
	 bit  7,h
	 call nz,$026A
	 bit  7,d
	 call nz,$0274
	 or   a
	 sbc  hl,de
	 jp   nc,$08CA
	 exx
	 push hl
	 ld   h,(iy+$1d)
	 ld   l,(iy+$1c)
	 ld   a,$C0
	 and  l
	 ld   l,a
	 ld   a,$C0
	 and  e
	 ld   c,a
	 ld   b,d
	 xor  a
	 sbc  hl,bc
	 pop  hl
	 jp   $08DE
	 exx
	 push hl
	 ld   b,(iy+$1f)
	 ld   c,(iy+$1e)
	 ld   a,$C0
	 and  l
	 ld   l,a
	 ld   a,$C0
	 and  c
	 ld   c,a
	 xor  a
	 sbc  hl,bc
	 pop  hl
	 ld   (iy+$1f),h
	 ld   (iy+$1e),l
	 ld   (iy+$1d),d
	 ld   (iy+$1c),e
	 jp   z,$08F3
	 call $07DA
	 call $036E
	 ld   a,(iy+$11)
	 and  a
	 jp   z,$0905
	 ld   (iy+$0f),$00
	 ld   (iy+$10),$00
	 jp   $0346
	 jp   $0362
	 push bc
	 ex   af,af'
	 ld   a,b
	 ld   h,(iy+$1d)
	 ld   l,(iy+$1c)
	 ld   d,(iy+$27)
	 ld   e,(iy+$26)
	 ld   b,(iy+$29)
	 ld   c,(iy+$28)
	 exx
	 ld   h,(iy+$1f)
	 ld   l,(iy+$1e)
	 ld   d,(iy+$2f)
	 ld   e,(iy+$2e)
	 ld   b,(iy+$31)
	 ld   c,(iy+$30)
	 ex   de,hl
	 add  hl,bc
	 ex   de,hl
	 add  hl,de
	 exx
	 ex   de,hl
	 add  hl,bc
	 ex   de,hl
	 add  hl,de
	 exx
	 dec  a
	 jp   nz,$0930
	 ld   (iy+$2f),d
	 ld   (iy+$2e),e
	 push hl
	 exx
	 ld   (iy+$27),d
	 ld   (iy+$26),e
	 pop  de
	 ex   de,hl
	 pop  bc
	 ex   af,af'
	 ret
	 exx
	 ld   h,(iy+$16)
	 ld   l,(iy+$15)
	 push hl
	 exx
	 ret
	 xor  a
	 push hl
	 sbc  hl,de
	 ex   af,af'
	 pop  hl
	 sbc  hl,bc
	 jp   nc,$096C
	 ex   af,af'
	 jr   nc,$0972
	 jp   $0971
	 ex   af,af'
	 jr   c,$0972
	 jr   z,$0972
	 ret
	 inc  a
	 set  2,(iy+$11)
	 ret
	 ex   af,af'
	 push hl
	 push de
	 exx
	 pop  de
	 bit  1,(iy+$10)
	 jp   z,$099B
	 ld   h,(iy+$3d)
	 ld   l,(iy+$3c)
	 ld   b,(iy+$1d)
	 ld   c,(iy+$1c)
	 call $095B
	 and  a
	 jp   z,$099B
	 set  4,(iy+$12)
	 pop  de
	 bit  2,(iy+$10)
	 jp   z,$09BA
	 ld   h,(iy+$3f)
	 ld   l,(iy+$3e)
	 ld   b,(iy+$1f)
	 ld   c,(iy+$1e)
	 call $095B
	 and  a
	 jp   z,$09BA
	 set  5,(iy+$12)
	 ex   af,af'
	 exx
	 ret
	 ex   af,af'
	 ld   c,$00
	 ld   d,c
	 ld   h,(iy+$0e)
	 ld   l,(iy+$0d)
	 ld   a,l
	 ld   e,b
	 or   a
	 sbc  hl,de
	 jp   nc,$09D8
	 ld   c,l
	 ld   b,a
	 set  3,(iy+$11)
	 jp   $09DF
	 jp   nz,$09DF
	 set  3,(iy+$11)
	 ex   af,af'
	 ret
	 ex   af,af'
	 ld   l,(iy+$13)
	 ld   h,(iy+$14)
	 ld   a,(hl)
	 or   a
	 jp   z,$09F3
	 ld   (hl),$00
	 set  4,(iy+$11)
	 ex   af,af'
	 ret
	 ex   af,af'
	 exx
	 ld   l,(iy+$40)
	 ld   h,(iy+$41)
	 bit  1,(iy+$25)
	 jp   z,$0A41
	 exx
	 ld   a,b
	 exx
	 ld   b,a
	 ld   e,(iy+$43)
	 ld   c,e
	 ld   d,$00
	 add  hl,de
	 sla  e
	 rl   d
	 add  hl,de
	 ld   a,(iy+$42)
	 sub  b
	 jp   nc,$0A1C
	 cp   a
	 jp   nz,$0A36
	 neg
	 ld   b,a
	 inc  hl
	 inc  hl
	 inc  hl
	 inc  c
	 ld   a,(hl)
	 or   a
	 jp   nz,$0A33
	 inc  hl
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 ld   a,(hl)
	 ld   c,$00
	 jp   $0A17
	 inc  hl
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 ld   (iy+$42),a
	 ld   (iy+$43),c
	 ld   (iy+$21),h
	 ld   (iy+$20),l
	 exx
	 ex   af,af'
	 ret
	 ex   af,af'
	 push de
	 exx
	 bit  7,(iy+$27)
	 jp   nz,$0A71
	 pop  hl
	 ld   e,(iy+$2c)
	 ld   d,(iy+$2d)
	 or   a
	 sbc  hl,de
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$0A6E
	 set  2,(iy+$12)
	 set  0,(iy+$11)
	 jp   $0A8B
	 pop  de
	 ld   l,(iy+$2a)
	 ld   h,(iy+$2b)
	 or   a
	 sbc  hl,de
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$0A8B
	 set  3,(iy+$12)
	 set  0,(iy+$11)
	 exx
	 push hl
	 exx
	 bit  7,(iy+$2f)
	 jp   nz,$0AB2
	 pop  hl
	 ld   e,(iy+$32)
	 ld   d,(iy+$33)
	 or   a
	 sbc  hl,de
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$0AAF
	 set  0,(iy+$12)
	 set  0,(iy+$11)
	 jp   $0ACC
	 pop  de
	 ld   l,(iy+$34)
	 ld   h,(iy+$35)
	 or   a
	 sbc  hl,de
	 push af
	 pop  hl
	 ld   a,l
	 and  $84
	 jp   po,$0ACC
	 set  1,(iy+$12)
	 set  0,(iy+$11)
	 exx
	 bit  0,(iy+$10)
	 jp   z,$0B0D
	 bit  0,(iy+$11)
	 jp   z,$0AFD
	 dec  b
	 dec  c
	 push hl
	 ex   de,hl
	 ld   d,(iy+$27)
	 ld   e,(iy+$26)
	 or   a
	 sbc  hl,de
	 ex   (sp),hl
	 ld   d,(iy+$2f)
	 ld   e,(iy+$2e)
	 or   a
	 sbc  hl,de
	 pop  de
	 res  0,(iy+$11)
	 ld   a,$01
	 or   a
	 jp   $0B0A
	 ld   a,(iy+$12)
	 and  $0F
	 jp   z,$0B09
	 set  0,(iy+$11)
	 xor  a
	 jp   $0B4F
	 bit  0,(iy+$11)
	 jp   z,$0B4E
	 bit  2,(iy+$12)
	 jp   z,$0B24
	 ld   e,(iy+$2c)
	 ld   d,(iy+$2d)
	 jp   $0B31
	 bit  3,(iy+$12)
	 jp   z,$0B31
	 ld   e,(iy+$2a)
	 ld   d,(iy+$2b)
	 bit  0,(iy+$12)
	 jp   z,$0B41
	 ld   l,(iy+$32)
	 ld   h,(iy+$33)
	 jp   $0B4E
	 bit  1,(iy+$12)
	 jp   z,$0B4E
	 ld   l,(iy+$34)
	 ld   h,(iy+$35)
	 xor  a
	 jp   nz,$0A4B
	 ex   af,af'
	 ret
	 ld   bc,$0101
	 rst  $38
	 rst  $38
	 cp   $FD
	 call m,$FAFB
	 ret  m
	 rst  $30
	 push af
	 di
	 pop  af
	 rst  $28
	 db   $ed,$ea
	 rst  $20
	 push hl
	 jp   po,$DCDF
	 ret  c
	 push de
	 pop  de
	 adc  a,$CA
	 add  a,$C2
	 cp   (hl)
	 cp   c
	 or   l
	 or   c
	 xor  h
	 and  a
	 and  d
	 sbc  a,l
	 sbc  a,b
	 sub  e
	 adc  a,(hl)
	 adc  a,c
	 add  a,h
	 ld   a,(hl)
	 ld   a,c
	 ld   (hl),e
	 ld   l,l
	 ld   l,b
	 ld   h,d
	 ld   e,h
	 ld   d,(hl)
	 ld   d,b
	 ld   c,d
	 ld   b,h
	 ld   a,$38
	 ld   ($262C),a
	 rra
	 add  hl,de
	 inc  de
	 dec  c
	 ld   b,$00
	 ld   hl,$0B54
	 ld   d,$00
	 cp   $40
	 jp   nc,$0BA7
	 ld   e,a
	 add  hl,de
	 ld   e,(hl)
	 ld   d,$00
	 jp   $0BD2
	 sub  $40
	 cp   $40
	 jp   nc,$0BB9
	 xor  $3F
	 ld   e,a
	 add  hl,de
	 inc  hl
	 ld   e,(hl)
	 ld   d,$FF
	 jp   $0BD2
	 sub  $40
	 cp   $40
	 jp   nc,$0BC8
	 ld   e,a
	 add  hl,de
	 ld   e,(hl)
	 ld   d,$FF
	 jp   $0BD2
	 sub  $40
	 xor  $3F
	 ld   e,a
	 add  hl,de
	 inc  hl
	 ld   e,(hl)
	 ld   d,$00
	 ld   l,c
	 ld   h,b
	 ld   a,d
	 or   a
	 push af
	 ld   a,e
	 cp   $01
	 jp   z,$0BF2
	 ld   c,e
	 ld   e,$00
	 xor  a
	 ld   b,$10
	 srl  h
	 rr   l
	 jp   nc,$0BEB
	 add  a,c
	 rra
	 rr   e
	 djnz $0BE3
	 ld   h,a
	 ld   l,e
	 pop  af
	 jp   z,$0BFD
	 ld   a,l
	 cpl
	 ld   l,a
	 ld   a,h
	 cpl
	 ld   h,a
	 inc  hl
	 ret
	 ld   a,(iy+$4a)
	 ld   c,(iy+$46)
	 ld   b,(iy+$47)
	 push af
	 push bc
	 call $0B95
	 ld   (iy+$26),l
	 ld   (iy+$27),h
	 pop  bc
	 pop  af
	 push af
	 sub  $40
	 call $0B95
	 ld   (iy+$2e),l
	 ld   (iy+$2f),h
	 ld   c,(iy+$48)
	 ld   b,(iy+$49)
	 ld   a,b
	 or   c
	 jp   z,$0C47
	 pop  af
	 push af
	 push bc
	 call $0B95
	 ld   (iy+$28),l
	 ld   (iy+$29),h
	 pop  bc
	 pop  af
	 sub  $40
	 call $0B95
	 ld   (iy+$30),l
	 ld   (iy+$31),h
	 jp   $0C55
	 pop  af
	 xor  a
	 ld   (iy+$28),a
	 ld   (iy+$29),a
	 ld   (iy+$30),a
	 ld   (iy+$31),a
	 set  4,(iy+$0f)
	 ret
	 ex   af,af'
	 ld   a,b
	 exx
	 ld   b,a
	 ld   a,(iy+$4b)
	 or   a
	 jp   nz,$0C82
	 ld   e,(iy+$48)
	 ld   d,(iy+$49)
	 ld   a,e
	 or   d
	 jp   nz,$0C7F
	 ld   l,(iy+$46)
	 ld   h,(iy+$47)
	 add  hl,de
	 djnz $0C76
	 ld   (iy+$46),l
	 ld   (iy+$47),h
	 jp   $0C90
	 sub  b
	 jp   nc,$0C87
	 xor  a
	 ld   (iy+$4b),a
	 jp   nz,$0C90
	 call $0BFE
	 exx
	 ex   af,af'
	 ret
	 ld   b,$00
	 ld   c,(iy+$0c)
	 cp   c
	 jp   c,$0362
	 sub  c
	 inc  b
	 cp   c
	 jp   nc,$0C9C
	 ld   c,a
	 ld   a,($D089)
	 sub  c
	 ld   (iy+$0b),a
	 ld   c,$00
	 ld   a,(iy+$0f)
	 bit  1,a
	 call nz,$09E1
	 bit  7,a
	 call nz,$09BD
	 bit  5,a
	 jp   nz,$0CDA
	 call $0908
	 bit  4,a
	 jp   z,$0CC9
	 call $0C5A
	 bit  3,a
	 call nz,$0978
	 bit  2,a
	 call nz,$0A4A
	 bit  0,(iy+$25)
	 call nz,$09F5
	 bit  6,a
	 call nz,$0951
	 jp   $0852
	 push iy
	 ld   iy,($D098)
	 ld   hl,$0C93
	 ld   (iy+$07),h
	 ld   (iy+$06),l
	 ld   hl,$079B
	 ld   (iy+$09),h
	 ld   (iy+$08),l
	 ld   (iy+$11),$00
	 ld   (iy+$12),$00
	 xor  a
	 cp   (iy+$0c)
	 jp   nz,$0D0D
	 ld   (iy+$0c),$01
	 jp   $0498
	 xor  e
	 push iy
	 ld   iy,($D098)
	 set  5,(iy+$0f)
	 jp   $0CE8
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$07),h
	 ld   (iy+$06),l
	 jp   $0498
	 push hl
	 ld   hl,($D098)
	 ld   de,$0008
	 add  hl,de
	 pop  de
	 ld   a,i
	 push af
	 di
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 pop  af
	 jp   po,$0D42
	 ei
	 ret
	 rst  $08
	 inc  de
	 inc  de
	 ld   bc,$0410
	 dec  b
	 dec  c
	 inc  d
	 inc  de
	 dec  d
	 ld   d,$06
	 nop
	 inc  bc
	 inc  c
	 rrca
	 jr   nc,$0D89
	 inc  a
	 ccf
	 ret  nz
	 jp   $CFCC
	 ret  p
	 di
	 call m,$E5FF
	 push iy
	 pop  hl
	 push af
	 rra
	 rra
	 rra
	 rra
	 and  $0F
	 ld   d,$00
	 ld   e,a
	 push hl
	 add  hl,de
	 ld   b,(hl)
	 pop  hl
	 pop  af
	 and  $0F
	 ld   e,a
	 add  hl,de
	 ld   c,(hl)
	 pop  hl
	 ret
	 ld   a,b
	 call $0D7F
	 ld   a,c
	 bit  6,(ix+$00)
	 jp   z,$0D94
	 ld   (hl),a
	 dec  hl
	 bit  3,(ix+$00)
	 jp   z,$0D91
	 ld   (hl),a
	 dec  hl
	 jp   $0D9F
	 ld   (hl),a
	 inc  hl
	 bit  3,(ix+$00)
	 jp   z,$0D9F
	 ld   (hl),a
	 inc  hl
	 ret
	 ld   a,b
	 and  $C0
	 jp   nz,$0DAC
	 call MAGIC_DRAW_BITMAP
	 ld   e,$01
	 ret
	 ld   a,c
	 out  ($0C),a
	 ld   a,b
	 out  ($19),a
	 push bc
	 push ix
	 pop  bc
	 ld   ix,$0000
	 add  ix,sp
	 dec  sp
	 dec  sp
	 dec  sp
	 dec  sp
	 ld   iy,$0D50
	 and  $C0
	 rlca
	 rlca
	 rlca
	 ld   (ix-$04),a
	 ld   (ix-$02),c
	 ld   (ix-$01),b
	 ld   a,(ix-$04)
	 ld   (ix-$03),a
	 ld   c,(ix-$02)
	 ld   b,(ix-$01)
	 push de
	 push hl
	 push de
	 ld   a,(bc)
	 inc  bc
	 push bc
	 call $0D60
	 call $0D7A
	 pop  bc
	 pop  de
	 dec  e
	 jp   nz,$0DE0
	 pop  hl
	 ld   de,$0050
	 bit  7,(ix+$00)
	 jp   z,$0E01
	 or   a
	 sbc  hl,de
	 jp   $0E02
	 add  hl,de
	 pop  de
	 dec  (ix-$03)
	 jp   nz,$0DD8
	 dec  d
	 jp   nz,$0DCC
	 pop  de
	 pop  hl
	 pop  bc
	 ret
	 ld   hl,($D098)
	 ld   de,$0046
	 add  hl,de
	 pop  de
	 sra  d
	 rr   e
	 sra  d
	 rr   e
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$004A
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 jp   (iy)
	 push bc
	 push iy
	 ld   iy,($D098)
	 call $0BFE
	 pop  iy
	 pop  bc
	 jp   (iy)
	 pop  de
	 pop  hl
	 push bc
	 ld   a,e
	 ld   c,l
	 ld   b,h
	 call $0B95
	 pop  bc
	 push hl
	 jp   (iy)
	 pop  de
	 pop  hl
	 push bc
	 push iy
	 ld   iy,($D098)
	 ld   a,(iy+$4a)
	 add  a,l
	 ld   (iy+$4a),a
	 ld   (iy+$4b),e
	 ld   c,(iy+$46)
	 ld   b,(iy+$47)
	 push af
	 push bc
	 call $0B95
	 exx
	 pop  bc
	 pop  af
	 sub  $40
	 call $0B95
	 ld   e,(iy+$2e)
	 ld   d,(iy+$2f)
	 or   a
	 sbc  hl,de
	 ld   a,(iy+$4b)
	 sra  h
	 rr   l
	 srl  a
	 jp   nz,$0E7F
	 ld   a,h
	 and  l
	 cp   $FF
	 jp   nz,$0E92
	 ld   hl,$0000
	 ld   (iy+$31),h
	 ld   (iy+$30),l
	 exx
	 ld   e,(iy+$26)
	 ld   d,(iy+$27)
	 or   a
	 sbc  hl,de
	 ld   a,(iy+$4b)
	 sra  h
	 rr   l
	 srl  a
	 jp   nz,$0EA5
	 ld   a,h
	 and  l
	 cp   $FF
	 jp   nz,$0EB8
	 ld   hl,$0000
	 ld   (iy+$29),h
	 ld   (iy+$28),l
	 set  4,(iy+$0f)
	 pop  iy
	 pop  bc
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  7,(hl)
	 ld   de,$FFFE
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  1,(hl)
	 ld   de,$0004
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0011
	 add  hl,de
	 ld   de,$0000
	 bit  4,(hl)
	 jp   z,$0EFD
	 inc  e
	 push de
	 jp   (iy)
	 ld   de,$00A0
	 add  hl,de
	 xor  a
	 sra  h
	 rr   l
	 rra
	 sra  h
	 rr   l
	 rra
	 ld   h,l
	 ld   l,a
	 ret
	 sra  d
	 rr   e
	 sra  d
	 rr   e
	 ret
	 sla  e
	 rl   d
	 sla  e
	 rl   d
	 ret
	 bit  7,h
	 jp   z,$0F2E
	 ld   a,$FF
	 jp   $0F2F
	 xor  a
	 sla  l
	 rl   h
	 rla
	 sla  l
	 rl   h
	 rla
	 ld   l,h
	 ld   h,a
	 or   a
	 ld   de,$00A0
	 sbc  hl,de
	 ret
	 sra  d
	 rr   e
	 sra  d
	 rr   e
	 ld   a,d
	 cpl
	 ld   d,a
	 ld   a,e
	 cpl
	 ld   e,a
	 inc  de
	 ret
	 ld   a,d
	 cpl
	 ld   d,a
	 ld   a,e
	 cpl
	 ld   e,a
	 inc  de
	 sla  e
	 rl   d
	 sla  e
	 rl   d
	 ret
	 call $026A
	 ld   de,$0063
	 add  hl,de
	 xor  a
	 sra  h
	 rr   l
	 rra
	 sra  h
	 rr   l
	 rra
	 ld   h,l
	 ld   l,a
	 ret
	 bit  7,h
	 jp   z,$0F81
	 ld   a,$FF
	 jp   $0F82
	 xor  a
	 sla  l
	 rl   h
	 rla
	 sla  l
	 rl   h
	 rla
	 ld   l,h
	 ld   h,a
	 or   a
	 ld   de,$0063
	 sbc  hl,de
	 call $026A
	 ret
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  2,(hl)
	 inc  hl
	 set  0,(hl)
	 jp   (iy)
	 pop  hl
	 call $0F00
	 push hl
	 ld   hl,($D098)
	 ld   de,$002A
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 call $0F00
	 push hl
	 ld   hl,($D098)
	 ld   de,$002C
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 call $0F62
	 push hl
	 ld   hl,($D098)
	 ld   de,$0032
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 call $0F62
	 push hl
	 ld   hl,($D098)
	 ld   de,$0034
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  3,(hl)
	 inc  hl
	 set  1,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  3,(hl)
	 inc  hl
	 set  2,(hl)
	 jp   (iy)
	 pop  hl
	 call $0F00
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$3c),l
	 ld   (iy+$3d),h
	 set  3,(iy+$0f)
	 set  1,(iy+$10)
	 pop  iy
	 jp   (iy)
	 pop  hl
	 call $0F62
	 push iy
	 ld   iy,($D098)
	 ld   (iy+$3e),l
	 ld   (iy+$3f),h
	 set  3,(iy+$0f)
	 set  2,(iy+$10)
	 pop  iy
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0012
	 add  hl,de
	 ld   de,$0000
	 bit  4,(hl)
	 jp   z,$1052
	 inc  e
	 push de
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0011
	 add  hl,de
	 ld   de,$0000
	 bit  2,(hl)
	 jp   z,$1065
	 inc  e
	 push de
	 jp   (iy)
	 pop  hl
	 ld   de,$003C
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 call $0F24
	 push hl
	 jp   (iy)
	 pop  hl
	 ld   de,$003E
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 call $0F77
	 push hl
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 set  6,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000F
	 add  hl,de
	 res  6,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0015
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   (iy+$41),h
	 ld   (iy+$40),l
	 set  0,(iy+$25)
	 pop  iy
	 jp   (iy)
	 pop  hl
	 push iy
	 ld   iy,($D098)
	 ld   a,(hl)
	 ld   (iy+$43),$00
	 ld   (iy+$42),a
	 set  1,(iy+$25)
	 jp   $10A9
	 ld   hl,($D098)
	 ld   de,$0025
	 add  hl,de
	 ld   a,(hl)
	 and  $F0
	 ld   (hl),a
	 jp   (iy)
	 pop  hl
	 call $0F00
	 push hl
	 ld   hl,($D098)
	 ld   de,$001C
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 call $0F62
	 push hl
	 ld   hl,($D098)
	 ld   de,$001E
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0026
	 add  hl,de
	 pop  de
	 call $0F12
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$002E
	 add  hl,de
	 pop  de
	 call $0F42
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 pop  hl
	 ld   de,$001C
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 call $0F24
	 push hl
	 jp   (iy)
	 pop  hl
	 ld   de,$001E
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ex   de,hl
	 call $0F77
	 push hl
	 jp   (iy)
	 pop  hl
	 ld   de,$0026
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 call $0F1B
	 push de
	 jp   (iy)
	 pop  hl
	 ld   de,$002E
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 call $0F52
	 push de
	 jp   (iy)
	 pop  hl
	 ld   de,$0046
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 call $0F1B
	 push de
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0026
	 add  hl,de
	 xor  a
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 ld   de,$0005
	 add  hl,de
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 inc  hl
	 ld   (hl),a
	 jp   (iy)
	 rst  $08
	 dec  bc
	 rla
	 dec  bc
	 jr   $118E
	 ld   hl,($D098)
	 ld   de,$0020
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),d
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001B
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 set  3,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 res  3,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 set  4,(hl)
	 res  5,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 res  4,(hl)
	 set  5,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 set  7,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 set  6,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 set  2,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 res  2,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 res  7,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001A
	 add  hl,de
	 res  6,(hl)
	 jp   (iy)
	 rst  $08
	 add  hl,de
	 ld   a,(de)
	 ld   b,$2A
	 sbc  a,b
	 ret  nc
	 push hl
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$0024
	 add  hl,de
	 set  0,(hl)
	 set  3,(hl)
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000B
	 add  hl,de
	 ld   a,($D089)
	 dec  a
	 ld   (hl),a
	 jp   (iy)
	 pop  hl
	 ld   de,$0004
	 add  hl,de
	 bit  3,(hl)
	 ld   de,$0000
	 jp   z,$1245
	 inc  e
	 push de
	 jp   (iy)
	 push bc
	 ld   bc,($D151)
	 ld   hl,$1321
	 add  hl,bc
	 push hl
	 ld   hl,$2776
	 adc  hl,bc
	 ld   de,($D153)
	 add  hl,de
	 ex   (sp),hl
	 add  hl,bc
	 ex   (sp),hl
	 adc  hl,de
	 ex   (sp),hl
	 add  hl,bc
	 ex   (sp),hl
	 adc  hl,de
	 ex   (sp),hl
	 ld   d,e
	 ld   e,b
	 ld   b,c
	 ld   c,$00
	 add  hl,bc
	 ld   ($D151),hl
	 ex   (sp),hl
	 adc  hl,de
	 ld   ($D153),hl
	 pop  de
	 pop  bc
	 ret
	 push bc
	 exx
	 ld   hl,$0000
	 ld   d,h
	 ld   e,l
	 exx
	 push de
	 pop  bc
	 ex   de,hl
	 ld   hl,$0000
	 srl  b
	 rr   c
	 jp   nc,$1293
	 add  hl,de
	 exx
	 adc  hl,de
	 exx
	 ld   a,b
	 or   c
	 jp   z,$12A5
	 sla  e
	 rl   d
	 exx
	 rl   e
	 rl   d
	 exx
	 jp   $1287
	 exx
	 pop  bc
	 ret
	 push de
	 call $1248
	 pop  de
	 call $1279
	 ret
	 call $1248
	 push hl
	 jp   (iy)
	 call $1248
	 pop  de
	 call $1279
	 push hl
	 jp   (iy)
	 call $0346
	 jp   $036E
	 push iy
	 push bc
	 ld   iy,($D098)
	 ld   hl,$0781
	 call $0D2D
	 ld   hl,$12C1
	 pop  bc
	 jp   $0D24
	 push bc
	 push ix
	 push iy
	 ld   a,i
	 push af
	 di
	 ld   iy,($D098)
	 ld   d,(iy+$1d)
	 ld   e,(iy+$1c)
	 ld   h,(iy+$1f)
	 ld   l,(iy+$1e)
	 call $07DA
	 call $0755
	 pop  af
	 jp   po,$12FF
	 ei
	 pop  iy
	 pop  ix
	 pop  bc
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$000C
	 add  hl,de
	 pop  de
	 ld   (hl),e
	 jp   (iy)
	 rst  $08
	 dec  de
	 ld   l,$03
	 dec  de
	 sbc  a,a
	 ret  nc
	 djnz $1335
	 sbc  a,b
	 ret  nc
	 inc  e
	 dec  de
	 ret  c
	 inc  b
	 dec  de
	 add  a,h
	 ret  nc
	 djnz $1333
	 ld   h,h
	 dec  de
	 adc  a,b
	 ret  nc
	 ex   af,af'
	 dec  de
	 sub  c
	 ret  nc
	 dec  e
	 dec  de
	 sub  d
	 ret  nc
	 dec  e
	 dec  de
	 jp   p,$1B05
	 add  a,b
	 ret  nc
	 djnz $1348
	 ret  z
	 dec  de
	 add  a,(hl)
	 ret  nc
	 ex   af,af'
	 dec  de
	 sub  b
	 ret  nc
	 dec  e
	 dec  de
	 sub  e
	 ret  nc
	 dec  e
	 dec  de
	 ld   (hl),e
	 ld   b,$1B
	 add  a,d
	 ret  nc
	 djnz $135D
	 ld   ($871B),a
	 ret  nc
	 ex   af,af'
	 dec  de
	 sub  l
	 ret  nc
	 dec  e
	 ld   c,$19
	 dec  de
	 adc  a,a
	 ret  nc
	 ex   af,af'
	 dec  de
	 adc  a,c
	 ret  nc
	 dec  e
	 dec  de
	 sub  (hl)
	 ret  nc
	 dec  e
	 dec  de
	 sub  a
	 ret  nc
	 dec  e
	 dec  de
	 ld   (hl),$03
	 ld   e,$1B
	 ld   a,($1E03)
	 dec  de
	 ld   a,$03
	 ld   e,$1B
	 ld   b,d
	 inc  bc
	 ld   e,$0E
	 jr   z,$138B
	 add  hl,bc
	 rra
	 add  hl,bc
	 ld   c,$08
	 rra
	 ld   c,$4A
	 dec  de
	 adc  a,l
	 ret  nc
	 ex   af,af'
	 ld   c,$F5
	 dec  de
	 adc  a,d
	 ret  nc
	 ex   af,af'
	 ld   c,$07
	 dec  de
	 adc  a,e
	 ret  nc
	 ex   af,af'
	 ld   c,$94
	 dec  de
	 adc  a,h
	 ret  nc
	 ex   af,af'
	 dec  de
	 adc  a,(hl)
	 ret  nc
	 dec  e
	 ld   c,$C8
	 ld   c,$0A
	 rra
	 ld   c,$70
	 ld   c,$04
	 rra
	 ld   c,$53
	 ld   c,$05
	 rra
	 ld   c,$E6
	 ld   c,$06
	 rra
	 ld   c,$6F
	 ld   c,$07
	 rra
	 jr   nz,$13C0
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 nop
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 jr   $1408
	 jr   $13EA
	 jr   $13EC
	 jr   $13EE
	 inc  a
	 inc  a
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   b,$3E
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   a,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   b,$1C
	 ld   e,$06
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   b,$06
	 ld   b,$06
	 ld   a,h
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   a,h
	 ld   a,(hl)
	 ld   b,$66
	 ld   a,(hl)
	 inc  a
	 inc  a
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   a,h
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   b,$0E
	 inc  c
	 inc  e
	 jr   $144A
	 jr   nc,$1444
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,$06
	 ld   b,$3E
	 inc  a
	 inc  a
	 ld   b,d
	 sbc  a,c
	 and  l
	 and  c
	 and  c
	 and  l
	 sbc  a,c
	 ld   b,d
	 inc  a
	 jr   $1470
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,h
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,h
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,h
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   a,h
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,h
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   h,b
	 ld   h,b
	 ld   a,h
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   h,b
	 ld   h,b
	 ld   a,h
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 inc  a
	 ld   a,(hl)
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   l,(hl)
	 ld   l,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 inc  a
	 inc  a
	 jr   $149E
	 jr   $14A0
	 jr   $14A2
	 inc  a
	 inc  a
	 ld   b,$06
	 ld   b,$06
	 ld   b,$06
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   l,(hl)
	 ld   a,h
	 ld   a,b
	 ld   a,b
	 ld   l,h
	 ld   l,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   a,(hl)
	 ld   a,(hl)
	 jp   $E7E7
	 in   a,($DB)
	 jp   $C3C3
	 jp   $66C3
	 ld   h,(hl)
	 halt
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   l,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   a,h
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,h
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 ld   h,b
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   l,(hl)
	 ld   h,h
	 ld   a,($7E7C)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 ld   a,h
	 ld   l,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,b
	 ld   a,h
	 ld   a,$06
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   a,(hl)
	 ld   a,(hl)
	 jr   $150C
	 jr   $150E
	 jr   $1510
	 jr   $1512
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 inc  a
	 jr   $1526
	 jp   $C3C3
	 in   a,($DB)
	 in   a,($FF)
	 rst  $20
	 jp   $66C3
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 jr   $1536
	 inc  a
	 ld   a,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   h,(hl)
	 ld   a,(hl)
	 inc  a
	 jr   $1540
	 jr   $1542
	 jr   $1544
	 ld   a,(hl)
	 ld   a,(hl)
	 ld   b,$0E
	 inc  e
	 jr   c,$15A3
	 ld   h,b
	 ld   a,(hl)
	 ld   a,(hl)
	 sbc  a,(hl)
	 push ix
	 push iy
	 push bc
	 ld   iy,($D098)
	 set  3,(iy+$1a)
	 ld   c,(iy+$1a)
	 ld   e,(iy+$1c)
	 ld   d,(iy+$1d)
	 ld   l,(iy+$1e)
	 ld   h,(iy+$1f)
	 call $071F
	 bit  6,(iy+$1a)
	 jp   z,$155E
	 dec  hl
	 ld   e,(iy+$20)
	 ld   d,(iy+$21)
	 ld   a,(de)
	 ld   b,a
	 inc  de
	 ld   a,(de)
	 push bc
	 push de
	 push hl
	 push hl
	 cp   $30
	 jp   nc,$1576
	 sub  $20
	 jp   $1582
	 cp   $40
	 jp   nc,$1580
	 sub  $2F
	 jp   $1582
	 sub  $35
	 ld   l,a
	 ld   h,$00
	 ld   e,l
	 ld   d,h
	 add  hl,de
	 add  hl,hl
	 add  hl,de
	 bit  5,(iy+$1b)
	 jp   nz,$159C
	 add  hl,hl
	 ld   de,$13BA
	 add  hl,de
	 ld   de,$0A01
	 jp   $15A3
	 ld   de,$1537
	 add  hl,de
	 ld   de,$0501
	 push hl
	 pop  ix
	 ld   b,(iy+$1b)
	 ld   c,(iy+$1a)
	 pop  hl
	 push iy
	 ld   a,i
	 push af
	 di
	 call $0DA0
	 pop  af
	 jp   po,$15BB
	 ei
	 pop  iy
	 ld   a,e
	 pop  hl
	 pop  de
	 pop  bc
	 inc  de
	 dec  b
	 jp   z,$15E9
	 bit  5,(iy+$1b)
	 jp   nz,$15CE
	 add  a,a
	 bit  6,(iy+$1a)
	 jp   nz,$15DE
	 add  a,l
	 ld   l,a
	 jp   nc,$15DB
	 inc  h
	 jp   $15E6
	 ld   c,a
	 ld   a,l
	 sub  c
	 ld   l,a
	 jp   nc,$15E6
	 dec  h
	 jp   $1567
	 pop  bc
	 pop  iy
	 pop  ix
	 jp   (iy)
	 ld   bc,$0000
	 nop
	 ld   a,(bc)
	 nop
	 nop
	 nop
	 ld   h,h
	 nop
	 nop
	 nop
	 ret  pe
	 inc  bc
	 nop
	 nop
	 djnz $1629
	 nop
	 nop
	 and  b
	 add  a,(hl)
	 ld   bc,$4000
	 ld   b,d
	 rrca
	 nop
	 add  a,b
	 sub  (hl)
	 sbc  a,b
	 nop
	 nop
	 pop  hl
	 push af
	 dec  b
	 nop
	 jp   z,$3B9A
	 xor  a
	 add  a,h
	 ld   a,$2B
	 jp   p,$1634
	 ld   de,$0000
	 exx
	 ld   de,$0000
	 exx
	 ex   de,hl
	 exx
	 ex   de,hl
	 exx
	 exx
	 or   a
	 sbc  hl,de
	 exx
	 sbc  hl,de
	 ld   a,$2D
	 ld   (iy+$00),a
	 inc  iy
	 ld   de,$15EC
	 push bc
	 pop  ix
	 add  ix,ix
	 add  ix,ix
	 add  ix,de
	 ld   d,(ix+$03)
	 ld   e,(ix+$02)
	 exx
	 ld   d,(ix+$01)
	 ld   e,(ix+$00)
	 exx
	 ld   a,$30
	 ld   b,$0A
	 exx
	 or   a
	 sbc  hl,de
	 exx
	 sbc  hl,de
	 jp   m,$1665
	 inc  a
	 djnz $1657
	 dec  a
	 exx
	 add  hl,de
	 exx
	 adc  hl,de
	 ld   (iy+$00),a
	 inc  iy
	 ld   de,$FFFC
	 add  ix,de
	 dec  c
	 jp   nz,$1645
	 ret
	 exx
	 pop  bc
	 pop  de
	 pop  hl
	 exx
	 pop  hl
	 push bc
	 push ix
	 push iy
	 exx
	 push de
	 pop  iy
	 call $1618
	 pop  iy
	 pop  ix
	 pop  bc
	 jp   (iy)
	 pop  hl
	 ld   e,(hl)
	 inc  hl
	 ld   a,e
	 cp   $01
	 jp   z,$16A9
	 ld   a,(hl)
	 cp   $30
	 jp   nz,$16A8
	 ld   (hl),$20
	 inc  hl
	 dec  e
	 jp   $16A9
	 xor  a
	 jp   nz,$1695
	 jp   (iy)
;*******************************************************************************
; ALIEN_SHIP_DESTROY_1
;
; Alien ship destruction animation, frame 1.
; Object record: $16AE; bitmap header: $16B0.
; Hotspot offsets: X = 16, Y = 4.
; Bitmap: 20 x 10 pixels, 5 bytes per row.
;*******************************************************************************
ALIEN_SHIP_DESTROY_1:
        .DB      $10,$04 ; Hotspot offsets: X = 16, Y = 4
ALIEN_SHIP_DESTROY_1_HEADER:
        .DB      $05,$0A ; Bitmap size: 5 bytes/row, 10 rows
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$05,$40,$00,$00 ; . . . . . . 1 1 1 . . . . . . . . . . .
        .DB      $00,$24,$78,$00,$00 ; . . . . . 2 1 . 1 3 2 . . . . . . . . .
        .DB      $00,$15,$58,$00,$00 ; . . . . . 1 1 1 1 1 2 . . . . . . . . .
        .DB      $00,$27,$E8,$00,$00 ; . . . . . 2 1 3 3 2 2 . . . . . . . . .
        .DB      $00,$64,$90,$00,$00 ; . . . . 1 2 1 . 2 1 . . . . . . . . . .
        .DB      $00,$46,$18,$00,$00 ; . . . . 1 . 1 2 . 1 2 . . . . . . . . .
        .DB      $00,$08,$00,$00,$00 ; . . . . . . 2 . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
;*******************************************************************************
; ALIEN_SHIP_DESTROY_2
;
; Alien ship destruction animation, frame 2.
; Object record: $16E4; bitmap header: $16E6.
; Hotspot offsets: X = 16, Y = 4.
; Bitmap: 20 x 10 pixels, 5 bytes per row.
;*******************************************************************************
ALIEN_SHIP_DESTROY_2:
        .DB      $10,$04 ; Hotspot offsets: X = 16, Y = 4
ALIEN_SHIP_DESTROY_2_HEADER:
        .DB      $05,$0A ; Bitmap size: 5 bytes/row, 10 rows
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$81,$0C,$00,$00 ; . . . . 2 . . 1 . . 3 . . . . . . . . .
        .DB      $00,$41,$10,$E0,$00 ; . . . . 1 . . 1 . 1 . . 3 2 . . . . . .
        .DB      $00,$00,$00,$18,$00 ; . . . . . . . . . . . . . 1 2 . . . . .
        .DB      $0F,$70,$21,$F8,$00 ; . . 3 3 1 3 . . . 2 . 1 3 3 2 . . . . .
        .DB      $00,$0E,$10,$33,$00 ; . . . . . . 3 2 . 1 . . . 3 . 3 . . . .
        .DB      $01,$F3,$0C,$C7,$00 ; . . . 1 3 3 . 3 . . 3 . 3 . 1 3 . . . .
        .DB      $0C,$43,$1C,$F0,$00 ; . . 3 . 1 . . 3 . 1 3 . 3 3 . . . . . .
        .DB      $30,$82,$0E,$30,$00 ; . 3 . . 2 . . 2 . . 3 2 . 3 . . . . . .
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
;*******************************************************************************
; ALIEN_SHIP_DESTROY_3
;
; Alien ship destruction animation, frame 3.
; Object record: $171A; bitmap header: $171C.
; Hotspot offsets: X = 16, Y = 4.
; Bitmap: 20 x 10 pixels, 5 bytes per row.
;*******************************************************************************
ALIEN_SHIP_DESTROY_3:
        .DB      $10,$04 ; Hotspot offsets: X = 16, Y = 4
ALIEN_SHIP_DESTROY_3_HEADER:
        .DB      $05,$0A ; Bitmap size: 5 bytes/row, 10 rows
        .DB      $00,$80,$02,$00,$00 ; . . . . 2 . . . . . . 2 . . . . . . . .
        .DB      $00,$01,$00,$02,$00 ; . . . . . . . 1 . . . . . . . 2 . . . .
        .DB      $00,$40,$10,$10,$00 ; . . . . 1 . . . . 1 . . . 1 . . . . . .
        .DB      $00,$04,$04,$00,$00 ; . . . . . . 1 . . . 1 . . . . . . . . .
        .DB      $90,$02,$01,$20,$08 ; 2 1 . . . . . 2 . . . 1 . 2 . . . . 2 .
        .DB      $00,$40,$10,$24,$00 ; . . . . 1 . . . . 1 . . . 2 1 . . . . .
        .DB      $01,$10,$08,$01,$00 ; . . . 1 . 1 . . . . 2 . . . . 1 . . . .
        .DB      $20,$04,$08,$08,$00 ; . 2 . . . . 1 . . . 2 . . . 2 . . . . .
        .DB      $08,$02,$00,$04,$00 ; . . 2 . . . . 2 . . . . . . 1 . . . . .
        .DB      $04,$02,$00,$00,$10 ; . . 1 . . . . 2 . . . . . . . . . 1 . .
 
;*******************************************************************************
; ALIEN_SHIP_DESTROY_4
;
; Alien ship destruction animation, frame 4.
; Object record: $1750; bitmap header: $1752.
; Hotspot offsets: X = 16, Y = 4.
; Bitmap: 20 x 10 pixels, 5 bytes per row.
;*******************************************************************************
ALIEN_SHIP_DESTROY_4:
        .DB      $10,$04 ; Hotspot offsets: X = 16, Y = 4
ALIEN_SHIP_DESTROY_4_HEADER:
        .DB      $05,$0A ; Bitmap size: 5 bytes/row, 10 rows
        .DB      $00,$02,$00,$00,$08 ; . . . . . . . 2 . . . . . . . . . . 2 .
        .DB      $02,$00,$00,$00,$00 ; . . . 2 . . . . . . . . . . . . . . . .
        .DB      $00,$00,$04,$00,$00 ; . . . . . . . . . . 1 . . . . . . . . .
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
        .DB      $08,$00,$00,$01,$00 ; . . 2 . . . . . . . . . . . . 1 . . . .
        .DB      $00,$04,$00,$00,$00 ; . . . . . . 1 . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$40,$01,$00 ; . . . . . . . . 1 . . . . . . 1 . . . .
        .DB      $00,$10,$00,$00,$00 ; . . . . . 1 . . . . . . . . . . . . . .
        .DB      $80,$00,$00,$80,$00 ; 2 . . . . . . . . . . . 2 . . . . . . .
;*******************************************************************************
; BLANK
;
; Blank replacement object used to remove an animated frame.
; Object record: $1786; bitmap header: $1788.
; Hotspot offsets: X = 0, Y = 0.
; Bitmap: 4 x 1 pixels, 1 byte per row.
;*******************************************************************************
BLANK:
        .DB      $00,$00 ; Hotspot offsets: X = 0, Y = 0
BLANK_HEADER:
        .DB      $01,$01 ; Bitmap size: 1 byte/row, 1 row
        .DB      $00 ; . . . .
; Alien ship destruction-frame sequence. Each entry is a control byte
; followed by a pointer to a complete sprite object record.
ALIEN_SHIP_DESTROY_SEQUENCE:
        .DB      $09
        .DW      ALIEN_SHIP_DESTROY_1
        .DB      $08
        .DW      ALIEN_SHIP_DESTROY_2
        .DB      $06
        .DW      ALIEN_SHIP_DESTROY_3
        .DB      $06
        .DW      ALIEN_SHIP_DESTROY_4
        .DB      $FF
        .DW      BLANK
        .DB      $00
        .DW      ALIEN_SHIP_DESTROY_SEQUENCE
;*******************************************************************************
; ALIEN_SHIP_VERTICAL
;
; Alien ship oriented for vertical approaches.
; Object record: $179D; bitmap header: $179F.
; Hotspot offsets: X = 8, Y = 6.
; Bitmap: 8 x 12 pixels, 2 bytes per row.
;*******************************************************************************
ALIEN_SHIP_VERTICAL:
        .DB      $08,$06 ; Hotspot offsets: X = 8, Y = 6
ALIEN_SHIP_VERTICAL_HEADER:
        .DB      $02,$0C ; Bitmap size: 2 bytes/row, 12 rows
        .DB      $40,$00 ; 1 . . . . . . .
        .DB      $30,$00 ; . 3 . . . . . .
        .DB      $1A,$00 ; . 1 2 2 . . . .
        .DB      $0E,$00 ; . . 3 2 . . . .
        .DB      $3A,$00 ; . 3 2 2 . . . .
        .DB      $FE,$00 ; 3 3 3 2 . . . .
        .DB      $FE,$00 ; 3 3 3 2 . . . .
        .DB      $3A,$00 ; . 3 2 2 . . . .
        .DB      $0E,$00 ; . . 3 2 . . . .
        .DB      $1A,$00 ; . 1 2 2 . . . .
        .DB      $30,$00 ; . 3 . . . . . .
        .DB      $40,$00 ; 1 . . . . . . .
;*******************************************************************************
; ALIEN_SHIP_HORIZONTAL
;
; Alien ship oriented for horizontal approaches.
; Object record: $17B9; bitmap header: $17BB.
; Hotspot offsets: X = 7, Y = 8.
; Bitmap: 12 x 7 pixels, 3 bytes per row.
;*******************************************************************************
ALIEN_SHIP_HORIZONTAL:
        .DB      $07,$08 ; Hotspot offsets: X = 7, Y = 8
ALIEN_SHIP_HORIZONTAL_HEADER:
        .DB      $03,$07 ; Bitmap size: 3 bytes/row, 7 rows
        .DB      $03,$00,$00 ; . . . 3 . . . . . . . .
        .DB      $83,$04,$00 ; 2 . . 3 . . 1 . . . . .
        .DB      $4F,$C8,$00 ; 1 . 3 3 3 . 2 . . . . .
        .DB      $6F,$D8,$00 ; 1 2 3 3 3 1 2 . . . . .
        .DB      $3F,$F0,$00 ; . 3 3 3 3 3 . . . . . .
        .DB      $17,$A0,$00 ; . 1 1 3 2 2 . . . . . .
        .DB      $3F,$F0,$00 ; . 3 3 3 3 3 . . . . . .
	 nop
	 ld   bc,$021D
	 rst  $38
	 ld   bc,$0100
	 jr   c,$17CC
;*******************************************************************************
; LASER_BASE_BODY
;
; Intact center laser-base body.
; Object record: $17DC; bitmap header: $17DE.
; Hotspot offsets: X = 0, Y = 0.
; Bitmap: 24 x 21 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_BODY:
        .DB      $00,$00 ; Hotspot offsets: X = 0, Y = 0
LASER_BASE_BODY_HEADER:
        .DB      $06,$15 ; Bitmap size: 6 bytes/row, 21 rows
        .DB      $55,$55,$55,$5A,$40,$00 ; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 1 . . . . . . .
        .DB      $5F,$FD,$FF,$5A,$40,$00 ; 1 1 3 3 3 3 3 1 3 3 3 3 1 1 2 2 1 . . . . . . .
        .DB      $77,$FF,$7F,$DA,$40,$00 ; 1 3 1 3 3 3 3 3 1 3 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7D,$FF,$DF,$DA,$40,$00 ; 1 3 3 1 3 3 3 3 3 1 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7F,$7F,$FF,$DA,$40,$00 ; 1 3 3 3 1 3 3 3 3 3 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7F,$DF,$FF,$DA,$40,$00 ; 1 3 3 3 3 1 3 3 3 3 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7F,$FF,$FF,$DA,$40,$00 ; 1 3 3 3 3 3 3 3 3 3 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7F,$FF,$FF,$DA,$40,$00 ; 1 3 3 3 3 3 3 3 3 3 3 3 3 1 2 2 1 . . . . . . .
        .DB      $7F,$FF,$FF,$DA,$50,$00 ; 1 3 3 3 3 3 3 3 3 3 3 3 3 1 2 2 1 1 . . . . . .
        .DB      $7F,$FF,$FF,$DA,$94,$00 ; 1 3 3 3 3 3 3 3 3 3 3 3 3 1 2 2 2 1 1 . . . . .
        .DB      $7F,$FF,$FF,$D6,$A5,$00 ; 1 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 2 2 1 1 . . . .
        .DB      $7F,$FF,$FF,$55,$A9,$40 ; 1 3 3 3 3 3 3 3 3 3 3 3 1 1 1 1 2 2 2 1 1 . . .
        .DB      $57,$FF,$FD,$D5,$6A,$40 ; 1 1 1 3 3 3 3 3 3 3 3 1 3 1 1 1 1 2 2 2 1 . . .
        .DB      $55,$55,$55,$75,$5A,$40 ; 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 2 2 1 . . .
        .DB      $AA,$AA,$A5,$5D,$5A,$40 ; 2 2 2 2 2 2 2 2 2 2 1 1 1 1 3 1 1 1 2 2 1 . . .
        .DB      $AA,$AA,$A9,$57,$5A,$40 ; 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 3 1 1 2 2 1 . . .
        .DB      $55,$55,$6A,$55,$DA,$40 ; 1 1 1 1 1 1 1 1 1 2 2 2 1 1 1 1 3 1 2 2 1 . . .
        .DB      $00,$00,$5A,$95,$5A,$40 ; . . . . . . . . 1 1 2 2 2 1 1 1 1 1 2 2 1 . . .
        .DB      $00,$00,$16,$AA,$AA,$40 ; . . . . . . . . . 1 1 2 2 2 2 2 2 2 2 2 1 . . .
        .DB      $00,$00,$05,$AA,$AA,$40 ; . . . . . . . . . . 1 1 2 2 2 2 2 2 2 2 1 . . .
        .DB      $00,$00,$01,$55,$55,$40 ; . . . . . . . . . . . 1 1 1 1 1 1 1 1 1 1 . . .
;*******************************************************************************
; LASER_BASE_BODY_DESTROY
;
; Damaged center laser-base body.
; Object record: $185E; bitmap header: $1860.
; Hotspot offsets: X = 0, Y = 0.
; Bitmap: 24 x 21 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_BODY_DESTROY:
        .DB      $00,$00 ; Hotspot offsets: X = 0, Y = 0
LASER_BASE_BODY_DESTROY_HEADER:
        .DB      $06,$15 ; Bitmap size: 6 bytes/row, 21 rows
        .DB      $00,$00,$00,$08,$D0,$00 ; . . . . . . . . . . . . . . 2 . 3 1 . . . . . .
        .DB      $00,$00,$00,$04,$20,$C0 ; . . . . . . . . . . . . . . 1 . . 2 . . 3 . . .
        .DB      $00,$00,$00,$43,$20,$00 ; . . . . . . . . . . . . 1 . . 3 . 2 . . . . . .
        .DB      $00,$00,$00,$04,$00,$00 ; . . . . . . . . . . . . . . 1 . . . . . . . . .
        .DB      $00,$00,$00,$23,$00,$00 ; . . . . . . . . . . . . . 2 . 3 . . . . . . . .
        .DB      $00,$00,$00,$20,$C0,$00 ; . . . . . . . . . . . . . 2 . . 3 . . . . . . .
        .DB      $00,$00,$08,$0C,$F0,$00 ; . . . . . . . . . . 2 . . . 3 . 3 3 . . . . . .
        .DB      $00,$08,$0C,$30,$40,$40 ; . . . . . . 2 . . . 3 . . 3 . . 1 . . . 1 . . .
        .DB      $00,$00,$0D,$23,$01,$00 ; . . . . . . . . . . 3 1 . 2 . 3 . . . 1 . . . .
        .DB      $00,$00,$00,$C2,$01,$00 ; . . . . . . . . . . . . 3 . . 2 . . . 1 . . . .
        .DB      $00,$00,$0C,$20,$40,$40 ; . . . . . . . . . . 3 . . 2 . . 1 . . . 1 . . .
        .DB      $00,$0C,$20,$50,$FD,$00 ; . . . . . . 3 . . 2 . . 1 1 . . 3 3 3 1 . . . .
        .DB      $00,$00,$01,$10,$63,$40 ; . . . . . . . . . . . 1 . 1 . . 1 2 . 3 1 . . .
        .DB      $00,$B2,$9C,$8A,$8A,$00 ; . . . . 2 3 . 2 2 1 3 . 2 . 2 2 2 . 2 2 . . . .
        .DB      $00,$E0,$50,$20,$20,$00 ; . . . . 3 2 . . 1 1 . . . 2 . . . 2 . . . . . .
        .DB      $23,$C8,$7C,$20,$00,$00 ; . 2 . 3 3 . 2 . 1 3 3 . . 2 . . . . . . . . . .
        .DB      $67,$CB,$30,$0C,$00,$00 ; 1 2 1 3 3 . 2 3 . 3 . . . . 3 . . . . . . . . .
        .DB      $31,$01,$50,$00,$00,$00 ; . 3 . 1 . . . 1 1 1 . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$40,$00,$00,$00,$00 ; . . . . 1 . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
;*******************************************************************************
; LASER_TURRET_VERTICAL
;
; Laser turret oriented vertically.
; Object record: $18E0; bitmap header: $18E2.
; Hotspot offsets: X = 7, Y = 9.
; Bitmap: 20 x 19 pixels, 5 bytes per row.
;*******************************************************************************
LASER_TURRET_VERTICAL:
        .DB      $07,$09 ; Hotspot offsets: X = 7, Y = 9
LASER_TURRET_VERTICAL_HEADER:
        .DB      $05,$13 ; Bitmap size: 5 bytes/row, 19 rows
        .DB      $00,$0F,$00,$00,$00 ; . . . . . . 3 3 . . . . . . . . . . . .
        .DB      $00,$3F,$C0,$00,$00 ; . . . . . 3 3 3 3 . . . . . . . . . . .
        .DB      $00,$30,$C0,$00,$00 ; . . . . . 3 . . 3 . . . . . . . . . . .
        .DB      $00,$3F,$C0,$00,$00 ; . . . . . 3 3 3 3 . . . . . . . . . . .
        .DB      $00,$0F,$00,$00,$00 ; . . . . . . 3 3 . . . . . . . . . . . .
        .DB      $02,$0F,$08,$00,$00 ; . . . 2 . . 3 3 . . 2 . . . . . . . . .
        .DB      $0A,$0F,$0A,$00,$00 ; . . 2 2 . . 3 3 . . 2 2 . . . . . . . .
        .DB      $0A,$0F,$0A,$00,$00 ; . . 2 2 . . 3 3 . . 2 2 . . . . . . . .
        .DB      $2B,$FF,$FE,$80,$00 ; . 2 2 3 3 3 3 3 3 3 3 2 2 . . . . . . .
        .DB      $2F,$FF,$FF,$80,$00 ; . 2 3 3 3 3 3 3 3 3 3 3 2 . . . . . . .
        .DB      $AF,$FF,$FF,$A0,$00 ; 2 2 3 3 3 3 3 3 3 3 3 3 2 2 . . . . . .
        .DB      $BF,$F5,$FF,$E0,$00 ; 2 3 3 3 3 3 1 1 3 3 3 3 3 2 . . . . . .
        .DB      $B7,$F5,$FD,$E0,$00 ; 2 3 1 3 3 3 1 1 3 3 3 1 3 2 . . . . . .
        .DB      $BB,$F5,$FD,$60,$00 ; 2 3 2 3 3 3 1 1 3 3 3 1 1 2 . . . . . .
        .DB      $85,$F5,$F5,$20,$00 ; 2 . 1 1 3 3 1 1 3 3 1 1 . 2 . . . . . .
        .DB      $85,$55,$55,$20,$00 ; 2 . 1 1 1 1 1 1 1 1 1 1 . 2 . . . . . .
        .DB      $81,$55,$54,$20,$00 ; 2 . . 1 1 1 1 1 1 1 1 . . 2 . . . . . .
        .DB      $80,$15,$40,$20,$00 ; 2 . . . . 1 1 1 1 . . . . 2 . . . . . .
        .DB      $00,$05,$00,$00,$00 ; . . . . . . 1 1 . . . . . . . . . . . .
;*******************************************************************************
; LASER_TURRET_VERTICAL_FIRE
;
; Vertical laser-turret firing frame.
; Object record: $1943; bitmap header: $1945.
; Hotspot offsets: X = 7, Y = 4.
; Bitmap: 20 x 16 pixels, 5 bytes per row.
;*******************************************************************************
LASER_TURRET_VERTICAL_FIRE:
        .DB      $07,$04 ; Hotspot offsets: X = 7, Y = 4
LASER_TURRET_VERTICAL_FIRE_HEADER:
        .DB      $05,$10 ; Bitmap size: 5 bytes/row, 16 rows
        .DB      $00,$0F,$00,$00,$00 ; . . . . . . 3 3 . . . . . . . . . . . .
        .DB      $00,$3F,$C0,$00,$00 ; . . . . . 3 3 3 3 . . . . . . . . . . .
        .DB      $02,$30,$C8,$00,$00 ; . . . 2 . 3 . . 3 . 2 . . . . . . . . .
        .DB      $0A,$3F,$CA,$00,$00 ; . . 2 2 . 3 3 3 3 . 2 2 . . . . . . . .
        .DB      $0A,$0F,$0A,$00,$00 ; . . 2 2 . . 3 3 . . 2 2 . . . . . . . .
        .DB      $2B,$FF,$FE,$80,$00 ; . 2 2 3 3 3 3 3 3 3 3 2 2 . . . . . . .
        .DB      $2F,$FF,$FF,$80,$00 ; . 2 3 3 3 3 3 3 3 3 3 3 2 . . . . . . .
        .DB      $AF,$FF,$FF,$A0,$00 ; 2 2 3 3 3 3 3 3 3 3 3 3 2 2 . . . . . .
        .DB      $BF,$F5,$FF,$E0,$00 ; 2 3 3 3 3 3 1 1 3 3 3 3 3 2 . . . . . .
        .DB      $B7,$F5,$FD,$E0,$00 ; 2 3 1 3 3 3 1 1 3 3 3 1 3 2 . . . . . .
        .DB      $BB,$F5,$FD,$60,$00 ; 2 3 2 3 3 3 1 1 3 3 3 1 1 2 . . . . . .
        .DB      $85,$F5,$F5,$20,$00 ; 2 . 1 1 3 3 1 1 3 3 1 1 . 2 . . . . . .
        .DB      $85,$55,$55,$20,$00 ; 2 . 1 1 1 1 1 1 1 1 1 1 . 2 . . . . . .
        .DB      $81,$55,$54,$20,$00 ; 2 . . 1 1 1 1 1 1 1 1 . . 2 . . . . . .
        .DB      $80,$15,$40,$20,$00 ; 2 . . . . 1 1 1 1 . . . . 2 . . . . . .
        .DB      $00,$05,$00,$00,$00 ; . . . . . . 1 1 . . . . . . . . . . . .
;*******************************************************************************
; LASER_TURRET_HORIZONTAL
;
; Laser turret oriented horizontally.
; Object record: $1997; bitmap header: $1999.
; Hotspot offsets: X = 7, Y = 7.
; Bitmap: 20 x 14 pixels, 5 bytes per row.
;*******************************************************************************
LASER_TURRET_HORIZONTAL:
        .DB      $07,$07 ; Hotspot offsets: X = 7, Y = 7
LASER_TURRET_HORIZONTAL_HEADER:
        .DB      $05,$0E ; Bitmap size: 5 bytes/row, 14 rows
        .DB      $00,$00,$0A,$A8,$00 ; . . . . . . . . . . 2 2 2 2 2 . . . . .
        .DB      $00,$00,$AB,$C0,$00 ; . . . . . . . . 2 2 2 3 3 . . . . . . .
        .DB      $00,$0A,$3F,$50,$00 ; . . . . . . 2 2 . 3 3 3 1 1 . . . . . .
        .DB      $00,$2A,$FF,$D0,$00 ; . . . . . 2 2 2 3 3 3 3 3 1 . . . . . .
        .DB      $00,$00,$FF,$D4,$00 ; . . . . . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $3F,$00,$FF,$D4,$00 ; . 3 3 3 . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $F3,$FF,$FD,$55,$00 ; 3 3 . 3 3 3 3 3 3 3 3 1 1 1 1 1 . . . .
        .DB      $F3,$FF,$FD,$55,$00 ; 3 3 . 3 3 3 3 3 3 3 3 1 1 1 1 1 . . . .
        .DB      $3F,$00,$FF,$D4,$00 ; . 3 3 3 . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $00,$00,$FF,$D4,$00 ; . . . . . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $00,$2A,$FF,$D0,$00 ; . . . . . 2 2 2 3 3 3 3 3 1 . . . . . .
        .DB      $00,$0A,$3F,$50,$00 ; . . . . . . 2 2 . 3 3 3 1 1 . . . . . .
        .DB      $00,$00,$AB,$C0,$00 ; . . . . . . . . 2 2 2 3 3 . . . . . . .
        .DB      $00,$00,$0A,$A8,$00 ; . . . . . . . . . . 2 2 2 2 2 . . . . .
;*******************************************************************************
; LASER_TURRET_HORIZONTAL_FIRE
;
; Horizontal laser-turret firing frame.
; Object record: $19E1; bitmap header: $19E3.
; Hotspot offsets: X = 5, Y = 7.
; Bitmap: 20 x 14 pixels, 5 bytes per row.
;*******************************************************************************
LASER_TURRET_HORIZONTAL_FIRE:
        .DB      $05,$07 ; Hotspot offsets: X = 5, Y = 7
LASER_TURRET_HORIZONTAL_FIRE_HEADER:
        .DB      $05,$0E ; Bitmap size: 5 bytes/row, 14 rows
        .DB      $00,$00,$0A,$A8,$00 ; . . . . . . . . . . 2 2 2 2 2 . . . . .
        .DB      $00,$00,$AB,$C0,$00 ; . . . . . . . . 2 2 2 3 3 . . . . . . .
        .DB      $00,$0A,$3F,$50,$00 ; . . . . . . 2 2 . 3 3 3 1 1 . . . . . .
        .DB      $00,$2A,$FF,$D0,$00 ; . . . . . 2 2 2 3 3 3 3 3 1 . . . . . .
        .DB      $00,$00,$FF,$D4,$00 ; . . . . . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $00,$FC,$FF,$D4,$00 ; . . . . 3 3 3 . 3 3 3 3 3 1 1 . . . . .
        .DB      $03,$CF,$FD,$55,$00 ; . . . 3 3 . 3 3 3 3 3 1 1 1 1 1 . . . .
        .DB      $03,$CF,$FD,$55,$00 ; . . . 3 3 . 3 3 3 3 3 1 1 1 1 1 . . . .
        .DB      $00,$FC,$FF,$D4,$00 ; . . . . 3 3 3 . 3 3 3 3 3 1 1 . . . . .
        .DB      $00,$00,$FF,$D4,$00 ; . . . . . . . . 3 3 3 3 3 1 1 . . . . .
        .DB      $00,$2A,$FF,$D0,$00 ; . . . . . 2 2 2 3 3 3 3 3 1 . . . . . .
        .DB      $00,$0A,$3F,$50,$00 ; . . . . . . 2 2 . 3 3 3 1 1 . . . . . .
        .DB      $00,$00,$AB,$C0,$00 ; . . . . . . . . 2 2 2 3 3 . . . . . . .
        .DB      $00,$00,$0A,$A8,$00 ; . . . . . . . . . . 2 2 2 2 2 . . . . .
; Laser-turret frame sequences. Control bytes precede object-record pointers;
; $00 terminates each list by pointing back to its first entry.
LASER_TURRET_VERTICAL_IDLE_SEQUENCE:
        .DB      $FF
        .DW      LASER_TURRET_VERTICAL
        .DB      $00
        .DW      LASER_TURRET_VERTICAL_IDLE_SEQUENCE
LASER_TURRET_HORIZONTAL_IDLE_SEQUENCE:
        .DB      $FF
        .DW      LASER_TURRET_HORIZONTAL
        .DB      $00
        .DW      LASER_TURRET_HORIZONTAL_IDLE_SEQUENCE
LASER_TURRET_VERTICAL_FIRE_SEQUENCE:
        .DB      $0E
        .DW      LASER_TURRET_VERTICAL_FIRE
        .DB      $FF
        .DW      LASER_TURRET_VERTICAL
        .DB      $00
        .DW      LASER_TURRET_VERTICAL_FIRE_SEQUENCE
LASER_TURRET_HORIZONTAL_FIRE_SEQUENCE:
        .DB      $0E
        .DW      LASER_TURRET_HORIZONTAL_FIRE
        .DB      $FF
        .DW      LASER_TURRET_HORIZONTAL
        .DB      $00
        .DW      LASER_TURRET_HORIZONTAL_FIRE_SEQUENCE
;*******************************************************************************
; SPACE_MINE_1
;
; Incoming space mine, growth stage 1.
; Object record: $1A49; bitmap header: $1A4B.
; Hotspot offsets: X = 2, Y = 2.
; Bitmap: 8 x 4 pixels, 2 bytes per row.
;*******************************************************************************
SPACE_MINE_1:
        .DB      $02,$02 ; Hotspot offsets: X = 2, Y = 2
SPACE_MINE_1_HEADER:
        .DB      $02,$04 ; Bitmap size: 2 bytes/row, 4 rows
        .DB      $14,$00 ; . 1 1 . . . . .
        .DB      $DD,$00 ; 3 1 3 1 . . . .
        .DB      $77,$00 ; 1 3 1 3 . . . .
        .DB      $1C,$00 ; . 1 3 . . . . .
;*******************************************************************************
; SPACE_MINE_2
;
; Incoming space mine, growth stage 2.
; Object record: $1A55; bitmap header: $1A57.
; Hotspot offsets: X = 3, Y = 3.
; Bitmap: 12 x 6 pixels, 3 bytes per row.
;*******************************************************************************
SPACE_MINE_2:
        .DB      $03,$03 ; Hotspot offsets: X = 3, Y = 3
SPACE_MINE_2_HEADER:
        .DB      $03,$06 ; Bitmap size: 3 bytes/row, 6 rows
        .DB      $07,$00,$00 ; . . 1 3 . . . . . . . .
        .DB      $37,$C0,$00 ; . 3 1 3 3 . . . . . . .
        .DB      $D5,$50,$00 ; 3 1 1 1 1 1 . . . . . .
        .DB      $77,$D0,$00 ; 1 3 1 3 3 1 . . . . . .
        .DB      $3D,$40,$00 ; . 3 3 1 1 . . . . . . .
        .DB      $0D,$00,$00 ; . . 3 1 . . . . . . . .
;*******************************************************************************
; SPACE_MINE_3
;
; Incoming space mine, growth stage 3.
; Object record: $1A6B; bitmap header: $1A6D.
; Hotspot offsets: X = 4, Y = 4.
; Bitmap: 12 x 8 pixels, 3 bytes per row.
;*******************************************************************************
SPACE_MINE_3:
        .DB      $04,$04 ; Hotspot offsets: X = 4, Y = 4
SPACE_MINE_3_HEADER:
        .DB      $03,$08 ; Bitmap size: 3 bytes/row, 8 rows
        .DB      $03,$C0,$00 ; . . . 3 3 . . . . . . .
        .DB      $0F,$50,$00 ; . . 3 3 1 1 . . . . . .
        .DB      $3D,$74,$00 ; . 3 3 1 1 3 1 . . . . .
        .DB      $DD,$DD,$00 ; 3 1 3 1 3 1 3 1 . . . .
        .DB      $77,$77,$00 ; 1 3 1 3 1 3 1 3 . . . .
        .DB      $17,$D4,$00 ; . 1 1 3 3 1 1 . . . . .
        .DB      $0D,$50,$00 ; . . 3 1 1 1 . . . . . .
        .DB      $01,$40,$00 ; . . . 1 1 . . . . . . .
;*******************************************************************************
; SPACE_MINE_4
;
; Incoming space mine, growth stage 4.
; Object record: $1A87; bitmap header: $1A89.
; Hotspot offsets: X = 4, Y = 5.
; Bitmap: 16 x 9 pixels, 4 bytes per row.
;*******************************************************************************
SPACE_MINE_4:
        .DB      $04,$05 ; Hotspot offsets: X = 4, Y = 5
SPACE_MINE_4_HEADER:
        .DB      $04,$09 ; Bitmap size: 4 bytes/row, 9 rows
        .DB      $01,$70,$00,$00 ; . . . 1 1 3 . . . . . . . . . .
        .DB      $05,$FC,$00,$00 ; . . 1 1 3 3 3 . . . . . . . . .
        .DB      $35,$75,$00,$00 ; . 3 1 1 1 3 1 1 . . . . . . . .
        .DB      $3D,$55,$00,$00 ; . 3 3 1 1 1 1 1 . . . . . . . .
        .DB      $DF,$5D,$40,$00 ; 3 1 3 3 1 1 3 1 1 . . . . . . .
        .DB      $55,$5F,$C0,$00 ; 1 1 1 1 1 1 3 3 3 . . . . . . .
        .DB      $35,$7D,$00,$00 ; . 3 1 1 1 3 3 1 . . . . . . . .
        .DB      $07,$74,$00,$00 ; . . 1 3 1 3 1 . . . . . . . . .
        .DB      $03,$D0,$00,$00 ; . . . 3 3 1 . . . . . . . . . .
;*******************************************************************************
; SPACE_MINE_5
;
; Incoming space mine, growth stage 5.
; Object record: $1AAF; bitmap header: $1AB1.
; Hotspot offsets: X = 5, Y = 6.
; Bitmap: 16 x 11 pixels, 4 bytes per row.
;*******************************************************************************
SPACE_MINE_5:
        .DB      $05,$06 ; Hotspot offsets: X = 5, Y = 6
SPACE_MINE_5_HEADER:
        .DB      $04,$0B ; Bitmap size: 4 bytes/row, 11 rows
        .DB      $00,$D4,$00,$00 ; . . . . 3 1 1 . . . . . . . . .
        .DB      $0F,$57,$C0,$00 ; . . 3 3 1 1 1 3 3 . . . . . . .
        .DB      $3F,$F5,$D0,$00 ; . 3 3 3 3 3 1 1 3 1 . . . . . .
        .DB      $3D,$FD,$50,$00 ; . 3 3 1 3 3 3 1 1 1 . . . . . .
        .DB      $35,$75,$70,$00 ; . 3 1 1 1 3 1 1 1 3 . . . . . .
        .DB      $D7,$55,$FC,$00 ; 3 1 1 3 1 1 1 1 3 3 3 . . . . .
        .DB      $55,$5D,$F4,$00 ; 1 1 1 1 1 1 3 1 3 3 1 . . . . .
        .DB      $1D,$DF,$F0,$00 ; . 1 3 1 3 1 3 3 3 3 . . . . . .
        .DB      $3F,$57,$F0,$00 ; . 3 3 3 1 1 1 3 3 3 . . . . . .
        .DB      $05,$5F,$40,$00 ; . . 1 1 1 1 3 3 1 . . . . . . .
        .DB      $00,$5C,$00,$00 ; . . . . 1 1 3 . . . . . . . . .
; Space-mine growth sequences. Control bytes precede object-record pointers.
SPACE_MINE_GROW_SEQUENCE:
        .DB      $1C
        .DW      SPACE_MINE_1
        .DB      $14
        .DW      SPACE_MINE_2
        .DB      $10
        .DW      SPACE_MINE_3
        .DB      $0C
        .DW      SPACE_MINE_4
        .DB      $FF
        .DW      SPACE_MINE_5
        .DB      $00
        .DW      SPACE_MINE_GROW_SEQUENCE
SPACE_MINE_FAST_GROW_SEQUENCE:
        .DB      $09
        .DW      SPACE_MINE_1
        .DB      $09
        .DW      SPACE_MINE_2
        .DB      $09
        .DW      SPACE_MINE_3
        .DB      $09
        .DW      SPACE_MINE_4
        .DB      $FF
        .DW      SPACE_MINE_5
        .DB      $00
        .DW      SPACE_MINE_GROW_SEQUENCE
;*******************************************************************************
; LASER_BASE_DESTROY_1
;
; Laser-base destruction animation, frame 1.
; Object record: $1B03; bitmap header: $1B05.
; Hotspot offsets: X = 8, Y = 6.
; Bitmap: 16 x 12 pixels, 4 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_1:
        .DB      $08,$06 ; Hotspot offsets: X = 8, Y = 6
LASER_BASE_DESTROY_1_HEADER:
        .DB      $04,$0C ; Bitmap size: 4 bytes/row, 12 rows
        .DB      $00,$C0,$04,$00 ; . . . . 3 . . . . . 1 . . . . .
        .DB      $C0,$F3,$00,$00 ; 3 . . . 3 3 . 3 . . . . . . . .
        .DB      $3F,$FF,$0C,$00 ; . 3 3 3 3 3 3 3 . . 3 . . . . .
        .DB      $0F,$FF,$FC,$00 ; . . 3 3 3 3 3 3 3 3 3 . . . . .
        .DB      $0F,$DF,$7F,$00 ; . . 3 3 3 1 3 3 1 3 3 3 . . . .
        .DB      $FF,$55,$7C,$00 ; 3 3 3 3 1 1 1 1 1 3 3 . . . . .
        .DB      $FD,$55,$7C,$00 ; 3 3 3 1 1 1 1 1 1 3 3 . . . . .
        .DB      $3F,$F5,$7C,$00 ; . 3 3 3 3 3 1 1 1 3 3 . . . . .
        .DB      $0F,$3F,$F0,$00 ; . . 3 3 . 3 3 3 3 3 . . . . . .
        .DB      $4C,$0F,$C1,$00 ; 1 . 3 . . . 3 3 3 . . 1 . . . .
        .DB      $00,$0F,$C0,$00 ; . . . . . . 3 3 3 . . . . . . .
        .DB      $00,$03,$00,$00 ; . . . . . . . 3 . . . . . . . .
;*******************************************************************************
; LASER_BASE_DESTROY_2
;
; Laser-base destruction animation, frame 2.
; Object record: $1B37; bitmap header: $1B39.
; Hotspot offsets: X = 10, Y = 8.
; Bitmap: 20 x 17 pixels, 5 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_2:
        .DB      $0A,$08 ; Hotspot offsets: X = 10, Y = 8
LASER_BASE_DESTROY_2_HEADER:
        .DB      $05,$11 ; Bitmap size: 5 bytes/row, 17 rows
        .DB      $01,$00,$00,$00,$00 ; . . . 1 . . . . . . . . . . . . . . . .
        .DB      $00,$40,$00,$00,$00 ; . . . . 1 . . . . . . . . . . . . . . .
        .DB      $00,$54,$00,$00,$00 ; . . . . 1 1 1 . . . . . . . . . . . . .
        .DB      $00,$14,$04,$00,$00 ; . . . . . 1 1 . . . 1 . . . . . . . . .
        .DB      $00,$15,$54,$00,$C0 ; . . . . . 1 1 1 1 1 1 . . . . . 3 . . .
        .DB      $00,$1D,$54,$14,$00 ; . . . . . 1 3 1 1 1 1 . . 1 1 . . . . .
        .DB      $00,$5F,$D5,$55,$00 ; . . . . 1 1 3 3 3 1 1 1 1 1 1 1 . . . .
        .DB      $00,$5F,$FF,$F5,$00 ; . . . . 1 1 3 3 3 3 3 3 3 3 1 1 . . . .
        .DB      $C1,$7F,$FF,$F4,$00 ; 3 . . 1 1 3 3 3 3 3 3 3 3 3 1 . . . . .
        .DB      $15,$7F,$FF,$D4,$00 ; . 1 1 1 1 3 3 3 3 3 3 3 3 1 1 . . . . .
        .DB      $15,$FF,$FF,$D4,$00 ; . 1 1 1 3 3 3 3 3 3 3 3 3 1 1 . . . . .
        .DB      $05,$FF,$FF,$F5,$00 ; . . 1 1 3 3 3 3 3 3 3 3 3 3 1 1 . . . .
        .DB      $05,$F5,$FD,$F4,$00 ; . . 1 1 3 3 1 1 3 3 3 1 3 3 1 . . . . .
        .DB      $00,$55,$55,$54,$00 ; . . . . 1 1 1 1 1 1 1 1 1 1 1 . . . . .
        .DB      $05,$14,$14,$45,$40 ; . . 1 1 . 1 1 . . 1 1 . 1 . 1 1 1 . . .
        .DB      $04,$00,$00,$40,$40 ; . . 1 . . . . . . . . . 1 . . . 1 . . .
        .DB      $50,$00,$00,$40,$00 ; 1 1 . . . . . . . . . . 1 . . . . . . .
;*******************************************************************************
; LASER_BASE_DESTROY_3
;
; Laser-base destruction animation, frame 3.
; Object record: $1B90; bitmap header: $1B92.
; Hotspot offsets: X = 12, Y = 11.
; Bitmap: 24 x 23 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_3:
        .DB      $0C,$0B ; Hotspot offsets: X = 12, Y = 11
LASER_BASE_DESTROY_3_HEADER:
        .DB      $06,$17 ; Bitmap size: 6 bytes/row, 23 rows
        .DB      $00,$00,$80,$00,$00,$00 ; . . . . . . . . 2 . . . . . . . . . . . . . . .
        .DB      $00,$02,$60,$00,$00,$00 ; . . . . . . . 2 1 2 . . . . . . . . . . . . . .
        .DB      $00,$A9,$58,$00,$00,$00 ; . . . . 2 2 2 1 1 1 2 . . . . . . . . . . . . .
        .DB      $02,$55,$56,$0A,$00,$00 ; . . . 2 1 1 1 1 1 1 1 2 . . 2 2 . . . . . . . .
        .DB      $0B,$DF,$F5,$A6,$80,$00 ; . . 2 3 3 1 3 3 3 3 1 1 2 2 1 2 2 . . . . . . .
        .DB      $25,$FF,$FD,$7D,$60,$00 ; . 2 1 1 3 3 3 3 3 3 3 1 1 3 3 1 1 2 . . . . . .
        .DB      $09,$7F,$FF,$FD,$58,$00 ; . . 2 1 1 3 3 3 3 3 3 3 3 3 3 1 1 1 2 . . . . .
        .DB      $02,$FF,$FF,$FF,$56,$00 ; . . . 2 3 3 3 3 3 3 3 3 3 3 3 3 1 1 1 2 . . . .
        .DB      $00,$BF,$FF,$FF,$D5,$80 ; . . . . 2 3 3 3 3 3 3 3 3 3 3 3 3 1 1 1 2 . . .
        .DB      $02,$5F,$FF,$FF,$FD,$60 ; . . . 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 . .
        .DB      $09,$7F,$FF,$FF,$F5,$80 ; . . 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 . . .
        .DB      $25,$FF,$FF,$FF,$D6,$00 ; . 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 . . . .
        .DB      $A5,$FF,$FF,$FF,$58,$00 ; 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 . . . . .
        .DB      $25,$5F,$FF,$F5,$58,$00 ; . 2 1 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 2 . . . . .
        .DB      $09,$FF,$FF,$FD,$A0,$00 ; . . 2 1 3 3 3 3 3 3 3 3 3 3 3 1 2 2 . . . . . .
        .DB      $02,$FB,$FF,$FE,$00,$00 ; . . . 2 3 3 2 3 3 3 3 3 3 3 3 2 . . . . . . . .
        .DB      $00,$ED,$FF,$FE,$00,$00 ; . . . . 3 2 3 1 3 3 3 3 3 3 3 2 . . . . . . . .
        .DB      $00,$9F,$FF,$FE,$A0,$00 ; . . . . 2 1 3 3 3 3 3 3 3 3 3 2 2 2 . . . . . .
        .DB      $02,$57,$DF,$FD,$58,$00 ; . . . 2 1 1 1 3 3 1 3 3 3 3 3 1 1 1 2 . . . . .
        .DB      $00,$95,$5B,$75,$60,$00 ; . . . . 2 1 1 1 1 1 2 3 1 3 1 1 1 2 . . . . . .
        .DB      $00,$25,$62,$55,$80,$00 ; . . . . . 2 1 1 1 2 . 2 1 1 1 1 2 . . . . . . .
        .DB      $00,$09,$80,$96,$00,$00 ; . . . . . . 2 1 2 . . . 2 1 1 2 . . . . . . . .
        .DB      $00,$02,$00,$28,$00,$00 ; . . . . . . . 2 . . . . . 2 2 . . . . . . . . .
	 ld   h,(hl)
;*******************************************************************************
; LASER_BASE_DESTROY_4
;
; Laser-base destruction animation, frame 4.
; Object record: $1C1F; bitmap header: $1C21.
; Hotspot offsets: X = 12, Y = 11.
; Bitmap: 24 x 23 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_4:
        .DB      $0C,$0B ; Hotspot offsets: X = 12, Y = 11
LASER_BASE_DESTROY_4_HEADER:
        .DB      $06,$17 ; Bitmap size: 6 bytes/row, 23 rows
        .DB      $80,$00,$08,$00,$00,$80 ; 2 . . . . . . . . . 2 . . . . . . . . . 2 . . .
        .DB      $20,$00,$20,$00,$02,$00 ; . 2 . . . . . . . 2 . . . . . . . . . 2 . . . .
        .DB      $08,$00,$80,$00,$08,$00 ; . . 2 . . . . . 2 . . . . . . . . . 2 . . . . .
        .DB      $02,$00,$80,$00,$20,$00 ; . . . 2 . . . . 2 . . . . . . . . 2 . . . . . .
        .DB      $00,$A2,$A1,$40,$80,$00 ; . . . . 2 2 . 2 2 2 . 1 1 . . . 2 . . . . . . .
        .DB      $00,$2B,$7E,$52,$00,$00 ; . . . . . 2 2 3 1 3 3 2 1 1 . 2 . . . . . . . .
        .DB      $00,$AF,$FF,$94,$02,$00 ; . . . . 2 2 3 3 3 3 3 3 2 1 1 . . . . 2 . . . .
        .DB      $00,$2D,$FF,$F4,$08,$00 ; . . . . . 2 3 1 3 3 3 3 3 3 1 . . . 2 . . . . .
        .DB      $00,$2B,$7F,$D5,$A0,$00 ; . . . . . 2 2 3 1 3 3 3 3 1 1 1 2 2 . . . . . .
        .DB      $00,$0B,$7F,$D8,$00,$00 ; . . . . . . 2 3 1 3 3 3 3 1 2 . . . . . . . . .
        .DB      $00,$AB,$7F,$DA,$00,$00 ; . . . . 2 2 2 3 1 3 3 3 3 1 2 2 . . . . . . . .
        .DB      $02,$BD,$FF,$F6,$00,$00 ; . . . 2 2 3 3 1 3 3 3 3 3 3 1 2 . . . . . . . .
        .DB      $0A,$DF,$FF,$E8,$00,$00 ; . . 2 2 3 1 3 3 3 3 3 3 3 2 2 . . . . . . . . .
        .DB      $2B,$D7,$FF,$60,$00,$00 ; . 2 2 3 3 1 1 3 3 3 3 3 1 2 . . . . . . . . . .
        .DB      $02,$B5,$FD,$68,$00,$00 ; . . . 2 2 3 1 1 3 3 3 1 1 2 2 . . . . . . . . .
        .DB      $02,$AF,$FD,$FA,$00,$00 ; . . . 2 2 2 3 3 3 3 3 1 3 3 2 2 . . . . . . . .
        .DB      $08,$2E,$AF,$F8,$00,$00 ; . . 2 . . 2 3 2 2 2 3 3 3 3 2 . . . . . . . . .
        .DB      $20,$28,$2B,$EA,$00,$00 ; . 2 . . . 2 2 . . 2 2 3 3 2 2 2 . . . . . . . .
        .DB      $80,$00,$0A,$A2,$80,$00 ; 2 . . . . . . . . . 2 2 2 2 . 2 2 . . . . . . .
        .DB      $00,$00,$08,$00,$20,$00 ; . . . . . . . . . . 2 . . . . . . 2 . . . . . .
        .DB      $00,$00,$20,$00,$08,$00 ; . . . . . . . . . 2 . . . . . . . . 2 . . . . .
        .DB      $00,$00,$80,$00,$02,$00 ; . . . . . . . . 2 . . . . . . . . . . 2 . . . .
        .DB      $00,$00,$00,$00,$00,$80 ; . . . . . . . . . . . . . . . . . . . . 2 . . .
;*******************************************************************************
; LASER_BASE_DESTROY_5
;
; Laser-base destruction animation, frame 5.
; Object record: $1CAD; bitmap header: $1CAF.
; Hotspot offsets: X = 12, Y = 11.
; Bitmap: 24 x 23 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_5:
        .DB      $0C,$0B ; Hotspot offsets: X = 12, Y = 11
LASER_BASE_DESTROY_5_HEADER:
        .DB      $06,$17 ; Bitmap size: 6 bytes/row, 23 rows
        .DB      $00,$00,$04,$03,$00,$00 ; . . . . . . . . . . 1 . . . . 3 . . . . . . . .
        .DB      $00,$30,$41,$40,$30,$00 ; . . . . . 3 . . 1 . . 1 1 . . . . 3 . . . . . .
        .DB      $00,$8C,$20,$08,$00,$00 ; . . . . 2 . 3 . . 2 . . . . 2 . . . . . . . . .
        .DB      $00,$00,$01,$00,$00,$00 ; . . . . . . . . . . . 1 . . . . . . . . . . . .
        .DB      $30,$90,$80,$C0,$20,$00 ; . 3 . . 2 1 . . 2 . . . 3 . . . . 2 . . . . . .
        .DB      $0C,$20,$02,$00,$0F,$C0 ; . . 3 . . 2 . . . . . 2 . . . . . . 3 3 3 . . .
        .DB      $30,$08,$28,$0C,$30,$00 ; . 3 . . . . 2 . . 2 2 . . . 3 . . 3 . . . . . .
        .DB      $00,$00,$30,$00,$03,$00 ; . . . . . . . . . 3 . . . . . . . . . 3 . . . .
        .DB      $0F,$C2,$A0,$14,$05,$40 ; . . 3 3 3 . . 2 2 2 . . . 1 1 . . . 1 1 1 . . .
        .DB      $03,$C1,$80,$50,$1A,$00 ; . . . 3 3 . . 1 2 . . . 1 1 . . . 1 2 2 . . . .
        .DB      $0F,$A1,$A1,$44,$4A,$40 ; . . 3 3 2 2 . 1 2 2 . 1 1 . 1 . 1 . 2 2 1 . . .
        .DB      $F0,$29,$85,$50,$54,$00 ; 3 3 . . . 2 2 1 2 . 1 1 1 1 . . 1 1 1 . . . . .
        .DB      $FC,$0A,$81,$54,$50,$00 ; 3 3 3 . . . 2 2 2 . . 1 1 1 1 . 1 1 . . . . . .
        .DB      $0C,$80,$2A,$90,$00,$40 ; . . 3 . 2 . . . . 2 2 2 2 1 . . . . . . 1 . . .
        .DB      $0F,$54,$08,$48,$50,$00 ; . . 3 3 1 1 1 . . . 2 . 1 . 2 . 1 1 . . . . . .
        .DB      $30,$14,$20,$40,$10,$00 ; . 3 . . . 1 1 . . 2 . . 1 . . . . 1 . . . . . .
        .DB      $01,$03,$0C,$04,$0C,$00 ; . . . 1 . . . 3 . . 3 . . . 1 . . . 3 . . . . .
        .DB      $00,$10,$00,$00,$40,$00 ; . . . . . 1 . . . . . . . . . . 1 . . . . . . .
        .DB      $20,$00,$04,$00,$00,$00 ; . 2 . . . . . . . . 1 . . . . . . . . . . . . .
        .DB      $01,$0C,$00,$0C,$04,$00 ; . . . 1 . . 3 . . . . . . . 3 . . . 1 . . . . .
        .DB      $00,$00,$08,$00,$00,$00 ; . . . . . . . . . . 2 . . . . . . . . . . . . .
        .DB      $00,$04,$00,$10,$C0,$00 ; . . . . . . 1 . . . . . . 1 . . 3 . . . . . . .
        .DB      $00,$00,$12,$0C,$00,$00 ; . . . . . . . . . 1 . 2 . . 3 . . . . . . . . .
;*******************************************************************************
; LASER_BASE_DESTROY_6
;
; Laser-base destruction animation, frame 6.
; Object record: $1D3B; bitmap header: $1D3D.
; Hotspot offsets: X = 12, Y = 11.
; Bitmap: 24 x 23 pixels, 6 bytes per row.
;*******************************************************************************
LASER_BASE_DESTROY_6:
        .DB      $0C,$0B ; Hotspot offsets: X = 12, Y = 11
LASER_BASE_DESTROY_6_HEADER:
        .DB      $06,$17 ; Bitmap size: 6 bytes/row, 23 rows
        .DB      $00,$00,$C0,$00,$00,$00 ; . . . . . . . . 3 . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $20,$00,$00,$00,$04,$00 ; . 2 . . . . . . . . . . . . . . . . 1 . . . . .
        .DB      $00,$00,$00,$20,$00,$00 ; . . . . . . . . . . . . . 2 . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$80 ; . . . . . . . . . . . . . . . . . . . . 2 . . .
        .DB      $02,$00,$00,$00,$00,$00 ; . . . 2 . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$10,$00,$00,$00 ; . . . . . . . . . 1 . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $C0,$00,$00,$00,$03,$00 ; 3 . . . . . . . . . . . . . . . . . . 3 . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$01,$02,$00,$00,$00 ; . . . . . . . 1 . . . 2 . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$C0,$00 ; . . . . . . . . . . . . . . . . 3 . . . . . . .
        .DB      $00,$00,$00,$00,$00,$40 ; . . . . . . . . . . . . . . . . . . . . 1 . . .
        .DB      $40,$00,$00,$00,$00,$00 ; 1 . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$40,$00,$00,$00 ; . . . . . . . . 1 . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$00,$00,$00 ; . . . . . . . . . . . . . . . . . . . . . . . .
        .DB      $01,$00,$00,$00,$00,$00 ; . . . 1 . . . . . . . . . . . . . . . . . . . .
        .DB      $00,$00,$00,$03,$00,$00 ; . . . . . . . . . . . . . . . 3 . . . . . . . .
        .DB      $00,$00,$04,$00,$00,$00 ; . . . . . . . . . . 1 . . . . . . . . . . . . .
        .DB      $00,$01,$00,$40,$00,$00 ; . . . . . . . 1 . . . . 1 . . . . . . . . . . .
; Laser-base destruction sequence.
LASER_BASE_DESTROY_SEQUENCE:
        .DB      $06
        .DW      LASER_BASE_DESTROY_1
        .DB      $06
        .DW      LASER_BASE_DESTROY_2
        .DB      $06
        .DW      LASER_BASE_DESTROY_3
        .DB      $06
        .DW      LASER_BASE_DESTROY_4
        .DB      $06
        .DW      LASER_BASE_DESTROY_5
        .DB      $06
        .DW      LASER_BASE_DESTROY_6
        .DB      $FF
        .DW      BLANK
        .DB      $00
        .DW      LASER_BASE_DESTROY_SEQUENCE
;*******************************************************************************
; ATTACK_SATELLITE_1
;
; Attack-satellite animation, frame 1.
; Object record: $1DE1; bitmap header: $1DE3.
; Hotspot offsets: X = 7, Y = 5.
; Bitmap: 20 x 11 pixels, 5 bytes per row.
;*******************************************************************************
ATTACK_SATELLITE_1:
        .DB      $07,$05 ; Hotspot offsets: X = 7, Y = 5
ATTACK_SATELLITE_1_HEADER:
        .DB      $05,$0B ; Bitmap size: 5 bytes/row, 11 rows
        .DB      $00,$01,$00,$00,$00 ; . . . . . . . 1 . . . . . . . . . . . .
        .DB      $C0,$05,$40,$0C,$00 ; 3 . . . . . 1 1 1 . . . . . 3 . . . . .
        .DB      $C0,$16,$50,$0C,$00 ; 3 . . . . 1 1 2 1 1 . . . . 3 . . . . .
        .DB      $C0,$5A,$94,$0C,$00 ; 3 . . . 1 1 2 2 2 1 1 . . . 3 . . . . .
        .DB      $C1,$6B,$A5,$0C,$00 ; 3 . . 1 1 2 2 3 2 2 1 1 . . 3 . . . . .
        .DB      $FD,$AF,$E9,$FC,$00 ; 3 3 3 1 2 2 3 3 3 2 2 1 3 3 3 . . . . .
        .DB      $C1,$6B,$A5,$0C,$00 ; 3 . . 1 1 2 2 3 2 2 1 1 . . 3 . . . . .
        .DB      $C0,$5A,$94,$0C,$00 ; 3 . . . 1 1 2 2 2 1 1 . . . 3 . . . . .
        .DB      $C0,$16,$50,$0C,$00 ; 3 . . . . 1 1 2 1 1 . . . . 3 . . . . .
        .DB      $C0,$05,$40,$0C,$00 ; 3 . . . . . 1 1 1 . . . . . 3 . . . . .
        .DB      $00,$01,$00,$00,$00 ; . . . . . . . 1 . . . . . . . . . . . .
;*******************************************************************************
; ATTACK_SATELLITE_2
;
; Attack-satellite animation, frame 2.
; Object record: $1E1C; bitmap header: $1E1E.
; Hotspot offsets: X = 7, Y = 5.
; Bitmap: 20 x 11 pixels, 5 bytes per row.
;*******************************************************************************
ATTACK_SATELLITE_2:
        .DB      $07,$05 ; Hotspot offsets: X = 7, Y = 5
ATTACK_SATELLITE_2_HEADER:
        .DB      $05,$0B ; Bitmap size: 5 bytes/row, 11 rows
        .DB      $00,$02,$00,$00,$00 ; . . . . . . . 2 . . . . . . . . . . . .
        .DB      $00,$0A,$80,$00,$00 ; . . . . . . 2 2 2 . . . . . . . . . . .
        .DB      $C0,$2B,$A0,$0C,$00 ; 3 . . . . 2 2 3 2 2 . . . . 3 . . . . .
        .DB      $C0,$AF,$E8,$0C,$00 ; 3 . . . 2 2 3 3 3 2 2 . . . 3 . . . . .
        .DB      $C2,$BD,$FA,$0C,$00 ; 3 . . 2 2 3 3 1 3 3 2 2 . . 3 . . . . .
        .DB      $FE,$F5,$7E,$FC,$00 ; 3 3 3 2 3 3 1 1 1 3 3 2 3 3 3 . . . . .
        .DB      $C2,$BD,$FA,$0C,$00 ; 3 . . 2 2 3 3 1 3 3 2 2 . . 3 . . . . .
        .DB      $C0,$AF,$E8,$0C,$00 ; 3 . . . 2 2 3 3 3 2 2 . . . 3 . . . . .
        .DB      $C0,$2B,$A0,$0C,$00 ; 3 . . . . 2 2 3 2 2 . . . . 3 . . . . .
        .DB      $00,$0A,$80,$00,$00 ; . . . . . . 2 2 2 . . . . . . . . . . .
        .DB      $00,$02,$00,$00,$00 ; . . . . . . . 2 . . . . . . . . . . . .
;*******************************************************************************
; ATTACK_SATELLITE_3
;
; Attack-satellite animation, frame 3.
; Object record: $1E57; bitmap header: $1E59.
; Hotspot offsets: X = 7, Y = 5.
; Bitmap: 20 x 11 pixels, 5 bytes per row.
;*******************************************************************************
ATTACK_SATELLITE_3:
        .DB      $07,$05 ; Hotspot offsets: X = 7, Y = 5
ATTACK_SATELLITE_3_HEADER:
        .DB      $05,$0B ; Bitmap size: 5 bytes/row, 11 rows
        .DB      $00,$03,$00,$00,$00 ; . . . . . . . 3 . . . . . . . . . . . .
        .DB      $00,$0F,$C0,$00,$00 ; . . . . . . 3 3 3 . . . . . . . . . . .
        .DB      $00,$3D,$F0,$00,$00 ; . . . . . 3 3 1 3 3 . . . . . . . . . .
        .DB      $00,$F5,$7C,$00,$00 ; . . . . 3 3 1 1 1 3 3 . . . . . . . . .
        .DB      $C3,$D6,$5F,$0C,$00 ; 3 . . 3 3 1 1 2 1 1 3 3 . . 3 . . . . .
        .DB      $FF,$5A,$97,$FC,$00 ; 3 3 3 3 1 1 2 2 2 1 1 3 3 3 3 . . . . .
        .DB      $C3,$D6,$5F,$0C,$00 ; 3 . . 3 3 1 1 2 1 1 3 3 . . 3 . . . . .
        .DB      $00,$F5,$7C,$00,$00 ; . . . . 3 3 1 1 1 3 3 . . . . . . . . .
        .DB      $00,$3D,$F0,$00,$00 ; . . . . . 3 3 1 3 3 . . . . . . . . . .
        .DB      $00,$0F,$C0,$00,$00 ; . . . . . . 3 3 3 . . . . . . . . . . .
        .DB      $00,$03,$00,$00,$00 ; . . . . . . . 3 . . . . . . . . . . . .
; Attack-satellite animation sequence.
ATTACK_SATELLITE_SEQUENCE:
        .DB      $04
        .DW      ATTACK_SATELLITE_1
        .DB      $04
        .DW      ATTACK_SATELLITE_2
        .DB      $04
        .DW      ATTACK_SATELLITE_3
        .DB      $04
        .DW      ATTACK_SATELLITE_2
        .DB      $00
        .DW      ATTACK_SATELLITE_SEQUENCE
        push de
	 ld   de,$0024
	 add  hl,de
	 pop  de
	 ret
	 ld   a,i
	 push af
	 xor  a
	 ld   i,a
	 ld   a,$A5
	 out  ($5B),a
	 ld   (hl),e
	 inc  hl
	 out  ($5B),a
	 ld   (hl),d
	 pop  af
	 ld   i,a
	 ret
	 ld   a,i
	 push af
	 di
	 call $1EA8
	 dec  hl
	 call $1EA1
	 call $1EA8
	 pop  af
	 jp   po,$1ECE
	 ei
	 ret
	 ld   a,i
	 push af
	 xor  a
	 ld   i,a
	 ld   a,$A5
	 out  ($5B),a
	 ld   (hl),e
	 pop  af
	 ld   i,a
	 ret
	 ld   a,i
	 push af
	 di
	 call $1ECF
	 call $1EA1
	 call $1ECF
	 pop  af
	 jp   po,$1EF0
	 ei
	 ret
	 pop  hl
	 pop  de
	 call $1EBB
	 jp   (iy)
	 pop  hl
	 ld   de,$0000
	 call $1EBB
	 jp   (iy)
	 pop  hl
	 pop  de
	 call $1EDE
	 jp   (iy)
	 pop  hl
	 ld   e,$01
	 call $1EDE
	 jp   (iy)
	 pop  hl
	 ld   e,$00
	 call $1EDE
	 jp   (iy)
	 pop  hl
	 ld   e,(hl)
	 dec  e
	 call $1EDE
	 jp   (iy)
	 exx
	 ld   a,r
	 ld   ($D151),a
	 ld   bc,$001A
	 ld   hl,$D001
	 ld   de,$D025
	 ld   a,(de)
	 cp   (hl)
	 jp   z,$1F35
	 inc  b
	 inc  hl
	 inc  de
	 dec  c
	 jp   nz,$1F2F
	 ld   a,b
	 or   a
	 jp   nz,$1F55
	 ld   hl,$D001
	 ld   a,(hl)
	 ld   bc,$0024
	 inc  hl
	 cp   (hl)
	 jp   z,$1F4D
	 inc  b
	 dec  c
	 jp   nz,$1F47
	 ld   a,b
	 jp   $1F56
	 xor  a
	 or   a
	 jp   nz,$1F85
	 ld   bc,$003F
	 ld   hl,$D001
	 ld   a,i
	 push af
	 di
	 ld   a,i
	 push af
	 xor  a
	 ld   i,a
	 ld   a,$A5
	 out  ($5B),a
	 ld   (hl),$00
	 inc  hl
	 dec  c
	 jp   nz,$1F6A
	 pop  af
	 ld   i,a
	 pop  af
	 jp   po,$1F7D
	 ei
	 ld   hl,$D001
	 ld   e,$01
	 call $1EDE
	 ld   hl,$D00F
	 ld   c,$10
	 in   e,(c)
	 call $1EDE
	 exx
	 jp   (iy)
	 rst  $08
	 ld   c,$10
	 ld   hl,$0B05
	 dec  de
	 ld   d,l
	 pop  de
	 dec  de
	 or   (hl)
	 inc  bc
	 ld   ($1B0B),hl
	 add  a,b
	 ld   a,(hl)
	 dec  de
	 add  a,b
	 ld   bc,$0B22
	 dec  de
	 dec  bc
	 push de
	 dec  de
	 ld   d,l
	 pop  de
	 inc  hl
	 inc  h
	 dec  h
	 rrca
	 ld   h,$1B
	 nop
	 add  a,b
	 dec  de
	 add  a,b
	 ld   a,(hl)
	 inc  hl
	 inc  h
	 dec  h
	 rrca
	 ld   h,$27
	 inc  bc
	 sub  a
	 rra
	 ld   b,$21
	 ld   ($1900),a
	 ld   (hl),$01
	 xor  a
	 ld   bc,$0818
	 dec  c
	 out  (c),a
	 dec  b
	 jp   nz,$1FCD
	 ld   hl,$001A
	 add  hl,de
	 ld   c,$18
	 ld   (hl),a
	 inc  hl
	 dec  c
	 jp   nz,$1FDA
	 exx
	 ret
	 ld   a,(iy+$22)
	 or   a
	 jp   z,$1FF7
	 dec  a
	 ld   (iy+$22),a
	 jp   nz,$1FF7
	 ld   (iy+$1c),a
	 ld   (iy+$32),$01
	 ret
	 xor  a
	 cp   (iy+$32)
	 jp   z,$2002
	 jp   $0362
	 ld   hl,$D002
	 cp   (hl)
	 jp   z,$20DE
	 inc  (iy+$31)
	 inc  a
	 cp   (iy+$31)
	 jp   nz,$20D2
	 xor  a
	 cp   (iy+$30)
	 jp   z,$2027
	 dec  (iy+$30)
	 jp   z,$2023
	 jp   $2027
	 ld   (iy+$32),$01
	 ld   a,(iy+$1c)
	 or   a
	 jp   z,$20A8
	 dec  (iy+$20)
	 jp   nz,$20A8
	 ld   l,(iy+$1f)
	 ld   c,$10
	 ld   a,(iy+$1a)
	 add  a,l
	 ld   (iy+$1a),a
	 out  (c),a
	 ld   d,a
	 ld   a,(iy+$1e)
	 dec  a
	 cp   d
	 jp   nc,$2073
	 call $1FE2
	 ld   a,(iy+$1b)
	 cp   $03
	 jp   nz,$205E
	 ld   a,$01
	 ld   (iy+$1b),a
	 jp   $2073
	 or   a
	 jp   z,$206F
	 inc  (iy+$1b)
	 ld   a,(iy+$1d)
	 sub  l
	 ld   (iy+$1a),a
	 jp   $2073
	 sub  l
	 ld   (iy+$1f),a
	 ld   a,(iy+$1d)
	 cp   d
	 jp   c,$20A2
	 call $1FE2
	 ld   a,(iy+$1b)
	 cp   $02
	 jp   nz,$208B
	 dec  (iy+$1b)
	 jp   $20A2
	 or   a
	 jp   z,$209E
	 ld   a,$03
	 ld   (iy+$1b),a
	 ld   a,(iy+$1e)
	 sub  l
	 ld   (iy+$1a),a
	 jp   $20A2
	 sub  l
	 ld   (iy+$1f),a
	 ld   a,(iy+$21)
	 ld   (iy+$20),a
	 ld   a,(iy+$25)
	 or   a
	 jp   z,$20CE
	 dec  (iy+$25)
	 jp   nz,$20CE
	 ld   c,$17
	 ld   a,(iy+$27)
	 add  a,(iy+$24)
	 ld   (iy+$27),a
	 out  (c),a
	 cp   (iy+$23)
	 jp   z,$20CE
	 ld   a,(iy+$26)
	 ld   (iy+$25),a
	 xor  a
	 ld   (iy+$31),a
	 cp   (iy+$32)
	 ld   (iy+$32),a
	 jp   nz,$20DE
	 jp   $0362
	 jp   $0346
	 ld   hl,$D187
	 ld   (hl),$00
	 ld   hl,$1FF8
	 jp   $0D1E
	 exx
	 ld   hl,$D185
	 pop  bc
	 ld   (hl),c
	 ld   hl,$D187
	 ld   (hl),$00
	 exx
	 ld   hl,$1FF8
	 jp   $0D1E
	 jp   $20EC
	 xor  a
	 ld   hl,$D170
	 ld   (hl),a
	 inc  hl
	 inc  a
	 ld   (hl),a
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),e
	 jp   (iy)
	 ld   a,$01
	 ld   hl,$D171
	 ld   (hl),a
	 ld   hl,$D177
	 pop  de
	 ld   (hl),e
	 jp   (iy)
	 exx
	 ld   c,$17
	 ld   hl,$D178
	 pop  de
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 inc  hl
	 ld   (hl),e
	 inc  hl
	 pop  de
	 ld   (hl),e
	 out  (c),e
	 exx
	 jp   (iy)
	 ld   a,$18
	 sub  b
	 ld   e,c
	 ld   c,a
	 out  (c),e
	 ret
	 exx
	 pop  bc
	 ld   b,$08
	 call $213E
	 ld   hl,$D16F
	 ld   (hl),e
	 exx
	 jp   (iy)
	 exx
	 pop  bc
	 ld   b,$01
	 call $213E
	 ld   hl,$D17C
	 ld   (hl),e
	 exx
	 jp   (iy)
	 exx
	 pop  bc
	 ld   b,$02
	 call $213E
	 exx
	 jp   (iy)
	 exx
	 pop  bc
	 ld   b,$03
	 call $213E
	 exx
	 jp   (iy)
	 pop  hl
	 exx
	 pop  bc
	 ld   b,$07
	 call $213E
	 pop  de
	 inc  c
	 out  (c),e
	 pop  de
	 inc  c
	 out  (c),e
	 exx
	 jp   (hl)
	 call $2176
	 jp   (iy)
	 call $2176
	 jp   $20EC
	 exx
	 ld   de,$D155
	 call $1FC3
	 jp   (iy)
	 rst  $08
	 jr   z,$21BA
	 inc  bc
	 ret  nc
	 add  hl,hl
	 ld   b,$CF
	 jr   z,$21C1
	 ld   (bc),a
	 ret  nc
	 dec  h
	 ld   b,$CF
	 ld   hl,($1D1B)
	 call nc,$2B1D
	 inc  bc
	 sub  $21
	 ld   c,$20
	 ld   c,$06
	 add  hl,bc
	 ld   c,$2F
	 inc  l
	 dec  bc
	 dec  l
	 ld   c,$06
	 add  hl,bc
	 ld   c,$0F
	 dec  bc
	 ld   l,$09
	 cpl
	 ld   c,$2E
	 ld   c,$59
	 ld   c,$85
	 jr   nc,$21DD
	 xor  d
	 ld   sp,$1C0E
	 ld   ($3433),a
	 dec  (hl)
	 ld   b,$CF
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 jp   po,$3621
	 scf
	 ld   b,$CF
	 ld   hl,($2B38)
	 inc  bc
	 ld   (de),a
	 ld   ($110E),hl
	 ld   c,$35
	 ld   c,$66
	 jr   nc,$2200
	 sub  a
	 ld   sp,$080E
	 ld   ($4D1B),a
	 jp   nc,$3A39
	 ld   c,$80
	 rrca
	 ld   c,$14
	 rra
	 dec  de
	 ld   c,l
	 jp   nc,$3A3B
	 ld   a,($350E)
	 rrca
	 dec  l
	 add  hl,bc
	 inc  a
	 dec  bc
	 inc  bc
	 rst  $30
	 ld   hl,$CF06
	 ld   c,$16
	 ld   b,$CF
	 ld   c,$1E
	 ld   b,$CF
	 ld   c,$2F
	 ld   b,$CF
	 ld   c,$50
	 ld   b,$CF
	 dec  d
	 dec  a
	 jr   nc,$224A
	 inc  de
	 ld   ($2217),hl
	 dec  de
	 ld   ($221F),hl
	 ld   b,$CF
	 ld   hl,($2B38)
	 inc  bc
	 ld   e,l
	 ld   ($951B),hl
	 pop  de
	 dec  h
	 ld   a,$0E
	 djnz $227F
	 dec  c
	 dec  l
	 add  hl,bc
	 ld   c,$03
	 inc  de
	 dec  c
	 ld   c,$27
	 rrca
	 inc  b
	 ld   l,$09
	 cpl
	 ld   c,$64
	 ld   c,$42
	 ld   c,$2C
	 jr   nc,$2264
	 ld   (hl),a
	 ld   sp,$080E
	 ld   ($3433),a
	 ld   b,$CF
	 ld   hl,($021B)
	 ret  nc
	 dec  h
	 inc  bc
	 add  a,(hl)
	 ld   ($1C0E),hl
	 ld   ($BB0E),a
	 ld   sp,$4D1B
	 jp   nc,$3A39
	 ld   c,$80
	 rrca
	 ld   b,b
	 dec  de
	 ld   c,l
	 jp   nc,$3A3B
	 ld   a,($350E)
	 rrca
	 dec  l
	 add  hl,bc
	 inc  a
	 dec  bc
	 inc  bc
	 ld   l,l
	 ld   ($CF06),hl
	 ld   hl,($032B)
	 cp   a
	 ld   ($030E),hl
	 dec  l
	 ld   c,$08
	 ld   b,b
	 ld   c,$1D
	 ld   ($BC0E),a
	 ld   sp,$0B0E
	 dec  de
	 dec  d
	 call nc,$0E08
	 inc  b
	 ld   b,c
	 ld   b,c
	 ld   b,c
	 ld   b,d
	 dec  de
	 dec  d
	 call nc,$1B43
	 inc  bc
	 ret  nc
	 dec  h
	 ld   c,$03
	 ld   b,h
	 inc  bc
	 or   a
	 ld   ($031B),hl
	 ret  nc
	 add  hl,hl
	 dec  de
	 dec  d
	 call nc,$2725
	 inc  bc
	 sbc  a,a
	 ld   ($1B34),hl
	 dec  d
	 call nc,$1B1D
	 dec  e
	 call nc,$381D
	 ld   b,$CF
	 ld   hl,($2B38)
	 inc  bc
	 ld   sp,hl
	 ld   ($881B),hl
	 pop  de
	 dec  h
	 ld   a,$0D
	 dec  l
	 add  hl,bc
	 dec  de
	 cp   $FF
	 ld   c,$03
	 ld   b,l
	 dec  c
	 ld   c,$14
	 ccf
	 ld   l,$0E
	 adc  a,l
	 ld   c,$4A
	 ld   c,$1F
	 jr   nc,$22F5
	 cpl
	 ld   c,$16
	 ccf
	 ld   b,b
	 ld   c,$66
	 ld   sp,$170E
	 ld   ($3433),a
	 ld   b,$CF
	 ld   hl,($2B38)
	 inc  bc
	 inc  e
	 inc  hl
	 ld   c,$10
	 dec  l
	 ld   c,$20
	 add  hl,bc
	 dec  de
	 cp   $FF
	 dec  bc
	 inc  l
	 ld   c,$A9
	 ld   sp,$1A0E
	 ld   ($110E),a
	 ld   c,$07
	 ld   c,$40
	 ld   c,$68
	 ld   b,d
	 inc  (hl)
	 ld   b,$CF
	 ld   hl,($2B38)
	 inc  bc
	 ld   c,a
	 inc  hl
	 dec  de
	 adc  a,b
	 pop  de
	 dec  h
	 ld   a,$0E
	 ld   (bc),a
	 ccf
	 dec  c
	 dec  l
	 ld   c,$02
	 add  hl,bc
	 ld   c,$03
	 ld   b,l
	 dec  c
	 ld   c,$28
	 rrca
	 inc  b
	 ld   l,$09
	 cpl
	 ld   c,$14
	 ccf
	 ld   b,b
	 ld   c,$66
	 ld   sp,$170E
	 ld   ($640E),a
	 ld   c,$42
	 ld   c,$2C
	 jr   nc,$2381
	 inc  (hl)
	 ld   b,$CF
	 ld   hl,($032B)
	 adc  a,(hl)
	 inc  hl
	 ld   c,$80
	 dec  l
	 ld   c,$94
	 add  hl,bc
	 dec  de
	 call m,$0EFF
	 ld   h,b
	 inc  l
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 ld   (hl),b
	 inc  hl
	 ld   c,$FF
	 ld   c,$1F
	 ld   b,(hl)
	 ld   (hl),h
	 inc  hl
	 ld   c,$99
	 ld   c,$19
	 ld   ($0931),a
	 ld   c,$20
	 ld   c,$30
	 ld   c,$44
	 ld   b,d
	 dec  de
	 inc  bc
	 ret  nc
	 add  hl,hl
	 ld   c,$05
	 inc  a
	 ld   c,$70
	 dec  l
	 ld   c,$08
	 inc  a
	 ld   b,(hl)
	 adc  a,a
	 inc  hl
	 inc  (hl)
	 jr   c,$23C5
	 dec  (hl)
	 ld   b,$CF
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 add  hl,bc
	 ld   b,h
	 daa
	 inc  bc
	 xor  b
	 inc  hl
	 ld   c,$03
	 dec  de
	 inc  bc
	 ret  nc
	 ld   b,a
	 dec  de
	 ld   d,l
	 pop  de
	 ld   c,b
	 ld   b,$CF
	 ld   hl,($032B)
	 inc  bc
	 inc  h
	 ld   c,$22
	 dec  l
	 ld   c,$77
	 ld   sp,$070E
	 ld   ($180E),a
	 dec  de
	 ld   de,$25D0
	 inc  bc
	 jp   z,$0E23
	 ld   a,(hl)
	 ld   c,$8D
	 ld   c,$A8
	 ld   b,(hl)
	 ret  nc
	 inc  hl
	 ld   c,$BD
	 ld   c,$7E
	 ld   c,$4A
	 ld   b,d
	 dec  de
	 ld   bc,$25D0
	 inc  bc
	 call po,$0E23
	 xor  d
	 ld   sp,$1B09
	 cp   $FF
	 ld   c,$05
	 ld   b,(hl)
	 pop  af
	 inc  hl
	 ld   c,$02
	 dec  de
	 rst  $38
	 rst  $38
	 add  hl,bc
	 ld   c,$1B
	 dec  de
	 ld   d,l
	 pop  de
	 rrca
	 ld   c,c
	 cpl
	 ld   c,$24
	 ld   c,$04
	 ld   l,$0E
	 inc  b
	 ld   c,$17
	 rra
	 ld   c,$24
	 dec  l
	 ld   c,$1A
	 ld   ($3433),a
	 dec  (hl)
	 ld   b,$79
	 rst  $08
	 ld   hl,($052B)
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 ld   c,$FD
	 ld   c,$64
	 ld   c,$54
	 jr   nc,$2425
	 ld   d,b
	 dec  l
	 add  hl,bc
	 dec  de
	 rst  $38
	 rst  $38
	 ld   c,$50
	 ld   c,$08
	 ld   l,$0E
	 xor  d
	 ld   sp,$090E
	 ld   ($900E),a
	 inc  a
	 inc  (hl)
	 dec  de
	 ld   bc,$25D0
	 dec  de
	 di
	 call nc,$4C4B
	 inc  bc
	 inc  a
	 inc  h
	 dec  de
	 ld   (bc),a
	 ret  nc
	 add  hl,hl
	 dec  de
	 inc  bc
	 ret  nc
	 ld   c,l
	 dec  de
	 dec  e
	 call nc,$4E25
	 inc  bc
	 ld   e,h
	 inc  h
	 ld   c,$02
	 dec  de
	 inc  bc
	 ret  nc
	 ex   af,af'
	 dec  de
	 ld   d,l
	 pop  de
	 inc  b
	 dec  d
	 dec  a
	 ld   e,h
	 inc  h
	 ex   (sp),hl
	 ld   hl,$225E
	 add  a,a
	 ld   ($0635),hl
	 rst  $08
	 ld   hl,($032B)
	 sub  d
	 inc  h
	 ld   c,$22
	 dec  l
	 ld   c,$1E
	 ld   c,$22
	 ld   c,$44
	 ld   c,$22
	 ld   l,$0E
	 ex   af,af'
	 ld   c,$66
	 ld   c,$55
	 ld   c,$40
	 jr   nc,$2488
	 call z,$0E31
	 dec  c
	 ld   ($020E),a
	 cpl
	 dec  de
	 ld   d,l
	 pop  de
	 ld   c,$1C
	 rrca
	 ld   c,c
	 inc  sp
	 dec  de
	 dec  d
	 call nc,$2725
	 inc  bc
	 ld   a,a
	 inc  h
	 inc  (hl)
	 dec  (hl)
	 ld   b,$CF
	 ld   hl,($032B)
	 cp   c
	 inc  h
	 ld   c,$85
	 ld   c,$77
	 ld   c,$59
	 jr   nc,$24B1
	 ld   b,b
	 dec  l
	 add  hl,bc
	 dec  de
	 call m,$0EFF
	 ld   b,b
	 ld   c,$08
	 ld   l,$0E
	 ld   d,$2F
	 ld   c,$DD
	 ld   sp,$0F0E
	 ld   ($3433),a
	 dec  (hl)
	 ld   b,$2A
	 sbc  a,b
	 ret  nc
	 ld   de,$001A
	 add  hl,de
	 res  4,(hl)
	 res  5,(hl)
	 jp   (iy)
	 ld   a,(iy+$1a)
	 xor  $80
	 ld   (iy+$1a),a
	 ret
	 ld   a,(iy+$1a)
	 xor  $40
	 ld   (iy+$1a),a
	 ret
	 rst  $08
	 dec  de
	 dec  l
	 call nc,$0D25
	 inc  bc
	 rst  $20
	 inc  h
	 dec  de
	 dec  l
	 call nc,$0643
	 rst  $08
	 dec  de
	 ld   l,$D4
	 dec  h
	 dec  c
	 inc  bc
	 push af
	 inc  h
	 dec  de
	 ld   l,$D4
	 ld   b,e
	 ld   b,$CF
	 dec  bc
	 dec  de
	 inc  l
	 call nc,$0608
	 rst  $08
	 ld   c,$07
	 dec  de
	 inc  l
	 call nc,$0E08
	 ld   b,$4F
	 ld   b,$CF
	 ld   d,b
	 ld   d,c
	 ld   c,$05
	 ld   d,d
	 ld   c,a
	 ld   b,$FD
	 sla  h
	 sbc  a,$C9
; Alternate alien-ship destruction sequence used by the gameplay script.
ALIEN_SHIP_DESTROY_SEQUENCE_ALT:
        .DB      $02
        .DW      BLANK
        .DB      $03
        .DW      ALIEN_SHIP_DESTROY_1
        .DB      $03
        .DW      ALIEN_SHIP_DESTROY_2
        .DB      $03
        .DW      ALIEN_SHIP_DESTROY_3
        .DB      $04
        .DW      ALIEN_SHIP_DESTROY_4
        .DB      $FF
        .DW      BLANK
        .DB      $00
        .DW      ALIEN_SHIP_DESTROY_SEQUENCE
	 ld   hl,($D098)
	 ld   de,$001C
	 add  hl,de
	 ld   (hl),$00
	 inc  hl
	 ld   (hl),$28
	 jp   (iy)
	 ld   hl,($D098)
	 ld   de,$001E
	 add  hl,de
	 ld   (hl),$C0
	 inc  hl
	 ld   (hl),$18
	 jp   (iy)
	 ld   a,$01
	 ld   ($D431),a
	 ret
	 pop  de
	 ld   hl,($D426)
	 add  hl,de
	 add  hl,de
	 ld   ($D426),hl
	 ld   a,($D014)
	 ld   l,a
	 ld   a,($D001)
	 or   l
	 jp   nz,$257C
	 ld   a,($D011)
	 or   a
	 jp   nz,$2571
	 ld   hl,($D015)
	 add  hl,de
	 ld   de,$D015
	 jp   $2578
	 ld   hl,($D017)
	 add  hl,de
	 ld   de,$D017
	 ex   de,hl
	 call $1EBB
	 ld   a,($D011)
	 or   a
	 jp   z,$25AA
	 ld   hl,($D017)
	 ld   de,($D01B)
	 sbc  hl,de
	 jp   c,$25A7
	 ld   hl,$D013
	 ld   e,(hl)
	 inc  e
	 call $1EDE
	 ld   hl,($D01B)
	 ld   e,l
	 ld   d,h
	 add  hl,de
	 ld   de,$D01B
	 ex   de,hl
	 call $1EBB
	 call $2546
	 jp   $25CE
	 ld   hl,($D015)
	 ld   de,($D019)
	 sbc  hl,de
	 jp   c,$25CE
	 ld   hl,$D012
	 ld   e,(hl)
	 inc  e
	 call $1EDE
	 ld   hl,($D019)
	 ld   e,l
	 ld   d,h
	 add  hl,de
	 ld   de,$D019
	 ex   de,hl
	 call $1EBB
	 call $2546
	 jp   (iy)
	 rst  $08
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   e,$26
	 ld   c,$10
	 dec  de
	 add  a,a
	 ret  nc
	 ex   af,af'
	 dec  de
	 inc  d
	 ret  nc
	 ld   c,d
	 dec  de
	 inc  hl
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   bc,$25D0
	 daa
	 inc  bc
	 ld   a,(de)
	 ld   h,$1B
	 ld   de,$25D0
	 inc  bc
	 call m,$1B25
	 inc  de
	 ret  nc
	 ld   b,(hl)
	 rst  $38
	 dec  h
	 dec  de
	 ld   (de),a
	 ret  nc
	 dec  c
	 dec  h
	 inc  bc
	 ex   af,af'
	 ld   h,$53
	 ld   b,(hl)
	 add  hl,bc
	 ld   h,$05
	 dec  de
	 ld   (de),a
	 ret  nc
	 dec  h
	 dec  de
	 inc  de
	 ret  nc
	 dec  h
	 ld   d,h
	 daa
	 inc  bc
	 ld   a,(de)
	 ld   h,$1B
	 ld   bc,$4AD0
	 dec  de
	 ld   bc,$55D2
	 ld   b,$CF
	 dec  de
	 sbc  a,h
	 pop  de
	 inc  c
	 dec  de
	 nop
	 ld   bc,$0307
	 ld   sp,$1B26
	 pop  af
	 ld   a,(de)
	 ld   b,(hl)
	 inc  (hl)
	 ld   h,$1B
	 rst  $18
	 ld   a,(de)
	 ld   b,$CF
	 dec  de
	 sbc  a,h
	 pop  de
	 inc  c
	 dec  c
	 ld   a,($060F)
	 rst  $08
	 ld   hl,($5756)
	 ld   e,b
	 ld   e,c
	 ld   e,d
	 dec  de
	 nop
	 ld   bc,$1B5B
	 djnz $2671
	 ld   e,h
	 ld   b,c
	 ld   e,l
	 ld   c,$88
	 ld   e,(hl)
	 dec  de
	 ld   a,b
	 rst  $38
	 ld   e,a
	 ld   c,$88
	 ld   h,b
	 dec  de
	 ld   a,b
	 rst  $38
	 ld   h,c
	 ld   b,c
	 ld   c,$0F
	 ld   c,h
	 ld   c,$05
	 ld   (bc),a
	 inc  bc
	 ld   l,b
	 ld   h,$62
	 ld   (hl),$63
	 ld   c,$60
	 rrca
	 ld   b,c
	 ld   c,$0F
	 ld   c,h
	 rrca
	 dec  de
	 nop
	 ld   b,$64
	 ld   e,e
	 ld   b,c
	 ld   c,$0C
	 ld   c,h
	 ld   c,$04
	 ld   d,d
	 ld   h,l
	 ld   h,(hl)
	 ld   d,a
	 ld   h,a
	 ld   l,b
	 ld   l,c
	 ld   l,d
	 dec  de
	 dec  d
	 dec  h
	 ld   l,e
	 ld   c,$10
	 ld   c,a
	 ld   l,h
	 ld   l,l
	 ld   b,c
	 ld   c,$07
	 ld   c,h
	 ld   c,$02
	 rlca
	 inc  bc
	 xor  (hl)
	 ld   h,$6E
	 dec  de
	 sub  c
	 pop  de
	 dec  h
	 ld   c,$40
	 rrca
	 ld   b,c
	 ld   c,$3F
	 ld   c,h
	 rrca
	 dec  c
	 dec  de
	 sub  c
	 pop  de
	 ex   af,af'
	 ld   e,l
	 ld   b,(hl)
	 or   c
	 ld   h,$56
	 ld   b,c
	 ld   e,l
	 ld   l,a
	 inc  bc
	 ld   e,l
	 ld   h,$06
	 rst  $08
	 ld   hl,($5756)
	 ld   e,b
	 ld   (hl),b
	 ld   e,d
	 ld   (hl),c
	 ld   h,a
	 ld   l,d
	 ld   (hl),d
	 ld   (hl),e
	 ld   d,b
	 ld   h,d
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   l,h
	 ld   l,l
	 ld   l,a
	 inc  bc
	 ret  nz
	 ld   h,$06
	 rst  $08
	 dec  de
	 sbc  a,c
	 jp   nc,$CF06
	 dec  de
	 push hl
	 jp   nc,$CF06
	 dec  de
	 ld   sp,$06D3
	 rst  $08
	 dec  de
	 ld   a,l
	 out  ($06),a
	 rst  $08
	 dec  de
	 adc  a,l
	 pop  de
	 ld   b,$CF
	 dec  de
	 adc  a,(hl)
	 pop  de
	 ld   b,$CF
	 dec  de
	 adc  a,a
	 pop  de
	 ld   b,$CF
	 dec  de
	 sub  b
	 pop  de
	 ld   b,$CF
	 dec  de
	 and  c
	 pop  de
	 ld   b,$CF
	 dec  de
	 and  d
	 pop  de
	 ld   b,$CF
	 dec  de
	 sbc  a,a
	 pop  de
	 ld   b,$CF
	 dec  de
	 and  b
	 pop  de
	 ld   b,$CF
	 dec  de
	 scf
	 ld   a,(de)
	 ld   b,$CF
	 dec  de
	 ld   b,b
	 ld   a,(de)
	 ld   b,$CF
	 ld   (hl),h
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   h,$27
	 dec  de
	 ld   d,l
	 pop  de
	 ld   (hl),l
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   b,$CF
	 dec  bc
	 rla
	 dec  de
	 xor  b
	 rst  $38
	 jr   $2753
	 dec  hl
	 ld   a,(de)
	 ld   b,$CF
	 dec  bc
	 rla
	 ld   c,$58
	 jr   $275D
	 dec  hl
	 ld   a,(de)
	 halt
	 ld   b,$CF
	 ld   c,$8C
	 rla
	 dec  bc
	 jr   $2768
	 ld   sp,$061A
	 rst  $08
	 dec  de
	 ld   (hl),h
	 rst  $38
	 rla
	 dec  bc
	 jr   $2773
	 ld   sp,$771A
	 ld   b,$CF
	 ld   hl,($0C0E)
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 ld   d,a
	 ld   l,d
	 add  hl,de
	 ld   a,(de)
	 ld   (hl),b
	 dec  (hl)
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 add  hl,bc
	 jr   z,$27D8
	 dec  de
	 sbc  a,d
	 pop  de
	 dec  e
	 dec  de
	 adc  a,b
	 pop  de
	 dec  h
	 dec  d
	 dec  a
	 add  a,h
	 daa
	 dec  sp
	 daa
	 ld   b,(hl)
	 daa
	 jr   nc,$27A9
	 ld   d,b
	 daa
	 ld   l,e
	 dec  de
	 adc  a,h
	 pop  de
	 dec  h
	 ld   c,(hl)
	 inc  bc
	 sbc  a,e
	 daa
	 dec  c
	 dec  de
	 adc  a,e
	 pop  de
	 dec  h
	 inc  b
	 ccf
	 dec  de
	 sbc  a,e
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 and  e
	 daa
	 dec  de
	 adc  a,e
	 pop  de
	 dec  h
	 dec  de
	 sbc  a,e
	 pop  de
	 dec  e
	 ld   c,a
	 dec  de
	 sbc  a,d
	 pop  de
	 ld   a,c
	 ld   l,h
	 ld   a,d
	 dec  de
	 sbc  a,d
	 pop  de
	 dec  h
	 ld   d,h
	 inc  bc
	 cp   c
	 daa
	 ld   c,$32
	 ld   a,e
	 ld   l,h
	 ld   b,(hl)
	 rlca
	 jr   z,$27D5
	 adc  a,h
	 pop  de
	 dec  h
	 inc  bc
	 rlca
	 jr   z,$27DC
	 adc  a,b
	 pop  de
	 dec  h
	 dec  d
	 dec  c
	 dec  c
	 dec  a
	 jp   nc,$D227
	 ld   h,$D7
	 ld   h,$DC
	 ld   h,$E1
	 ld   h,$0D
	 ld   c,e
	 inc  bc
	 di
	 daa
	 ld   d,l
	 dec  a
	 ex   (sp),hl
	 daa
	 and  $26
	 ex   de,hl
	 ld   h,$F0
	 ld   h,$F5
	 ld   h,$49
	 dec  a
	 rst  $28
	 daa
	 ld   c,$27
	 inc  de
	 daa
	 ld   c,$27
	 inc  de
	 daa
	 ld   l,e
	 ld   b,(hl)
	 push af
	 daa
	 dec  b
	 dec  b
	 dec  de
	 sbc  a,e
	 pop  de
	 dec  h
	 ld   c,a
	 dec  de
	 sbc  a,d
	 pop  de
	 ld   a,c
	 ld   l,h
	 ld   a,d
	 inc  bc
	 rlca
	 jr   z,$2812
	 ld   ($6C7B),a
	 ld   l,l
	 ld   a,b
	 inc  bc
	 ld   h,e
	 daa
	 ld   (hl),$7C
	 ld   b,$CF
	 ld   c,$0A
	 ld   b,$CF
	 dec  de
	 or   $FF
	 ld   b,$CF
	 ld   c,$0B
	 ld   b,$CF
	 dec  de
	 push af
	 rst  $38
	 ld   b,$CF
	 dec  bc
	 ld   b,$CF
	 add  hl,bc
	 ld   b,$CF
	 ld   c,$02
	 ld   b,$CF
	 ld   c,$03
	 ld   b,$CF
	 ld   c,$C0
	 ld   b,$CF
	 ld   c,$80
	 ld   b,$CF
	 ld   c,$40
	 ld   b,$CF
	 ld   c,$18
	 ld   a,l
	 ld   a,(hl)
	 ld   b,$CF
	 dec  de
	 ret  pe
	 rst  $38
	 ld   a,a
	 add  a,b
	 ld   b,$CF
	 dec  de
	 ret  pe
	 rst  $38
	 ld   a,l
	 dec  bc
	 ld   b,$CF
	 ld   c,$18
	 ld   a,a
	 add  a,c
	 ld   b,$CF
	 dec  de
	 sbc  a,b
	 pop  de
	 dec  h
	 dec  a
	 ld   h,l
	 jr   z,$2849
	 ld   h,$F0
	 ld   h,$F5
	 ld   h,$E6
	 ld   h,$06
	 rst  $08
	 dec  de
	 sbc  a,b
	 pop  de
	 dec  h
	 dec  a
	 halt
	 jr   z,$2878
	 daa
	 jp   m,$FF26
	 ld   h,$04
	 daa
	 ld   b,$CF
	 dec  de
	 sbc  a,b
	 pop  de
	 dec  h
	 dec  a
	 add  a,a
	 jr   z,$2857
	 ld   h,$DC
	 ld   h,$E1
	 ld   h,$D2
	 ld   h,$06
	 rst  $08
	 ld   c,$37
	 ld   c,$37
	 dec  bc
	 ld   b,$CF
	 ld   c,$37
	 ld   c,$37
	 add  a,d
	 add  hl,bc
	 ld   b,$CF
	 ld   c,$37
	 add  a,d
	 ld   c,$37
	 add  a,d
	 ld   c,$02
	 ld   b,$CF
	 ld   c,$37
	 add  a,d
	 ld   c,$37
	 ld   c,$03
	 ld   b,$CF
	 ld   hl,($0E41)
	 rlca
	 ld   c,h
	 dec  de
	 ld   de,$25D0
	 inc  bc
	 cp   l
	 jr   z,$28D3
	 sub  e
	 pop  de
	 ld   b,(hl)
	 ret  nz
	 jr   z,$28D9
	 sub  d
	 pop  de
	 dec  h
	 rrca
	 add  hl,bc
	 ld   d,d
	 dec  de
	 sub  (hl)
	 pop  de
	 ex   af,af'
	 ld   c,$0C
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 ld   l,d
	 ld   d,a
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 sub  d
	 ld   e,$6B
	 ld   b,c
	 ld   c,$03
	 ld   c,h
	 dec  a
	 call po,$8828
	 jr   z,$286E
	 jr   z,$2878
	 jr   z,$2884
	 jr   z,$2900
	 sub  a
	 pop  de
	 ex   af,af'
	 jr   $2901
	 ld   c,$58
	 ld   e,(hl)
	 dec  de
	 xor  b
	 rst  $38
	 ld   e,a
	 ld   c,$58
	 ld   h,b
	 dec  de
	 xor  b
	 rst  $38
	 ld   h,c
	 ld   b,c
	 ld   c,$07
	 ld   c,h
	 ld   c,$04
	 ld   (bc),a
	 dec  de
	 sub  h
	 pop  de
	 ex   af,af'
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 ld   (de),a
	 add  hl,hl
	 jr   $2934
	 jr   $2936
	 inc  e
	 jr   z,$292D
	 jr   z,$2990
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 ld   ($0F29),hl
	 jr   z,$2930
	 jr   z,$2932
	 jr   z,$2930
	 jr   z,$29A2
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  de
	 sub  h
	 pop  de
	 dec  h
	 inc  bc
	 inc  a
	 add  hl,hl
	 dec  a
	 add  hl,sp
	 add  hl,hl
	 ld   a,e
	 nop
	 scf
	 jr   z,$2969
	 jr   z,$2967
	 jr   z,$2980
	 ld   b,a
	 add  hl,hl
	 dec  a
	 ld   b,a
	 add  hl,hl
	 cpl
	 jr   z,$29BD
	 nop
	 scf
	 jr   z,$2979
	 jr   z,$29A5
	 dec  de
	 nop
	 inc  bc
	 ld   e,e
	 ld   h,(hl)
	 dec  de
	 sub  h
	 pop  de
	 dec  h
	 inc  bc
	 ld   e,c
	 add  hl,hl
	 ld   c,$20
	 ld   b,(hl)
	 ld   e,h
	 add  hl,hl
	 dec  de
	 ret  po
	 rst  $38
	 ld   c,$10
	 add  a,e
	 ld   c,$10
	 ld   c,a
	 add  a,h
	 add  a,l
	 ld   l,c
	 ld   l,b
	 ld   l,h
	 ld   h,(hl)
	 dec  de
	 sub  h
	 pop  de
	 dec  h
	 inc  bc
	 ld   (hl),h
	 add  hl,hl
	 ld   c,$20
	 ld   b,(hl)
	 ld   (hl),a
	 add  hl,hl
	 dec  de
	 ret  po
	 rst  $38
	 ld   c,$10
	 add  a,e
	 ld   c,$10
	 ld   c,a
	 add  a,h
	 add  a,l
	 ld   l,c
	 ld   l,h
	 ld   h,(hl)
	 add  a,(hl)
	 daa
	 inc  bc
	 adc  a,e
	 add  hl,hl
	 add  a,h
	 add  a,l
	 ld   l,c
	 ld   l,h
	 add  a,a
	 inc  bc
	 call z,$3629
	 adc  a,b
	 add  a,d
	 ld   a,l
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 and  d
	 add  hl,hl
	 inc  sp
	 jr   z,$29D0
	 jr   z,$2A1A
	 nop
	 ld   a,e
	 nop
	 ld   e,l
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 or   d
	 add  hl,hl
	 dec  hl
	 jr   z,$29D1
	 jr   z,$29D3
	 jr   z,$29DC
	 jr   z,$29CE
	 sbc  a,b
	 pop  de
	 ex   af,af'
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 push bc
	 add  hl,hl
	 dec  hl
	 jr   z,$29E7
	 jr   z,$29E6
	 jr   z,$29E5
	 jr   z,$29E1
	 sub  a
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 ld   b,$2A
	 ld   (hl),$89
	 add  a,d
	 ld   a,a
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 rst  $18
	 add  hl,hl
	 scf
	 jr   z,$2A09
	 jr   z,$2A0B
	 jr   z,$2A15
	 jr   z,$2A3D
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 rst  $28
	 add  hl,hl
	 ld   hl,$2128
	 jr   z,$2A13
	 jr   z,$2A15
	 jr   z,$2A0B
	 sbc  a,b
	 pop  de
	 ex   af,af'
	 dec  de
	 sub  a
	 pop  de
	 dec  h
	 dec  a
	 ld   (bc),a
	 ld   hl,($2824)
	 ld   hl,$2B28
	 jr   z,$2A28
	 jr   z,$2A1E
	 sub  a
	 pop  de
	 ex   af,af'
	 ld   l,b
	 dec  de
	 sbc  a,b
	 pop  de
	 dec  h
	 dec  a
	 ld   d,$2A
	 jr   c,$2A35
	 ld   hl,($3825)
	 dec  h
	 ld   hl,($8A25)
	 dec  e
	 adc  a,e
	 ld   c,c
	 adc  a,d
	 ld   a,c
	 ld   (hl),$0E
	 inc  e
	 rrca
	 inc  c
	 adc  a,h
	 ld   c,$1C
	 rrca
	 djnz $2A5D
	 ld   c,$1E
	 rrca
	 inc  c
	 adc  a,h
	 ld   c,$1E
	 rrca
	 djnz $2A4C
	 sub  (hl)
	 pop  de
	 ld   b,e
	 dec  de
	 sub  (hl)
	 pop  de
	 dec  h
	 daa
	 inc  bc
	 sub  (hl)
	 ld   hl,($981B)
	 pop  de
	 dec  h
	 dec  a
	 ld   c,e
	 ld   hl,($283B)
	 ld   b,c
	 jr   z,$2A90
	 jr   z,$2A99
	 jr   z,$2AA9
	 ld   h,(hl)
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 ld   c,$02
	 ld   b,h
	 inc  bc
	 ld   h,c
	 ld   hl,($020E)
	 dec  de
	 dec  e
	 call nc,$1B08
	 ld   d,l
	 pop  de
	 adc  a,l
	 ld   l,h
	 ld   a,d
	 inc  bc
	 ld   l,h
	 ld   hl,($C80E)
	 ld   (hl),h
	 ld   b,(hl)
	 ld   (hl),c
	 ld   hl,($1B8E)
	 ret
	 out  ($55),a
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 ld   c,$02
	 ld   b,h
	 inc  bc
	 adc  a,b
	 ld   hl,($030E)
	 dec  de
	 dec  e
	 call nc,$1B08
	 ld   d,l
	 pop  de
	 adc  a,a
	 ld   b,(hl)
	 adc  a,h
	 ld   hl,($1D1B)
	 call nc,$711D
	 adc  a,e
	 dec  e
	 dec  bc
	 ld   a,e
	 ld   l,h
	 add  hl,bc
	 ld   b,(hl)
	 add  a,$2A
	 ld   h,(hl)
	 ld   l,h
	 ld   a,d
	 adc  a,d
	 dec  h
	 ld   d,h
	 inc  bc
	 push bc
	 ld   hl,($8B71)
	 dec  e
	 ld   c,$C8
	 ld   a,e
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 ld   c,$02
	 ld   b,h
	 inc  bc
	 cp   h
	 ld   hl,($030E)
	 dec  de
	 dec  e
	 call nc,$1B08
	 ld   d,l
	 pop  de
	 adc  a,a
	 ld   b,(hl)
	 ret  nz
	 ld   hl,($1D1B)
	 call nc,$6C1D
	 add  hl,bc
	 ld   b,(hl)
	 add  a,$2A
	 dec  bc
	 adc  a,e
	 dec  e
	 adc  a,d
	 dec  e
	 inc  bc
	 inc  bc
	 add  hl,hl
	 ld   l,l
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 rst  $18
	 ld   hl,($7890)
	 inc  bc
	 push de
	 ld   hl,($9136)
	 ld   b,(hl)
	 pop  hl
	 ld   hl,($9236)
	 ld   b,$CF
	 dec  de
	 adc  a,b
	 pop  de
	 dec  h
	 ld   b,h
	 inc  bc
	 pop  af
	 ld   hl,($9A1B)
	 pop  de
	 ld   b,(hl)
	 call p,$1B2A
	 sbc  a,c
	 pop  de
	 ld   c,c
	 ld   b,$CF
	 dec  de
	 adc  a,c
	 pop  de
	 dec  h
	 dec  c
	 dec  de
	 sub  l
	 pop  de
	 ex   af,af'
	 add  hl,bc
	 sub  e
	 inc  l
	 dec  hl
	 dec  bc
	 sub  h
	 xor  c
	 pop  de
	 sub  l
	 ld   c,$18
	 jr   $2B18
	 rla
	 halt
	 sub  (hl)
	 dec  h
	 inc  bc
	 daa
	 dec  hl
	 sub  a
	 ld   c,c
	 sbc  a,b
	 dec  sp
	 ld   (hl),$3B
	 ccf
	 ld   c,$06
	 ld   d,d
	 ld   c,$03
	 sub  h
	 xor  c
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 add  hl,hl
	 dec  hl
	 add  hl,bc
	 sbc  a,c
	 ld   b,(hl)
	 cp   a
	 dec  hl
	 ld   c,$02
	 sub  e
	 ld   e,e
	 dec  hl
	 dec  bc
	 sub  h
	 and  h
	 pop  de
	 sub  l
	 dec  bc
	 jr   $2B47
	 jr   $2B52
	 sbc  a,d
	 dec  h
	 inc  bc
	 ld   d,l
	 dec  hl
	 sbc  a,e
	 ld   c,c
	 sbc  a,h
	 add  hl,sp
	 ld   (hl),$39
	 ccf
	 ld   c,$08
	 ld   d,d
	 ld   a,($0E3A)
	 ld   (bc),a
	 sub  h
	 and  h
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 ld   e,b
	 dec  hl
	 ld   c,$02
	 sbc  a,c
	 ld   b,(hl)
	 cp   a
	 dec  hl
	 ld   c,$03
	 sub  e
	 adc  a,e
	 dec  hl
	 dec  bc
	 sub  h
	 xor  c
	 pop  de
	 sub  l
	 dec  de
	 ret  pe
	 rst  $38
	 jr   $2B75
	 rla
	 sbc  a,l
	 dec  h
	 inc  bc
	 add  a,l
	 dec  hl
	 sbc  a,(hl)
	 ld   c,c
	 sbc  a,a
	 dec  sp
	 add  a,d
	 ld   (hl),$3B
	 add  a,d
	 ccf
	 ld   c,$06
	 ld   d,d
	 ld   c,$03
	 sub  h
	 xor  c
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 adc  a,b
	 dec  hl
	 ld   c,$03
	 sbc  a,c
	 ld   b,(hl)
	 cp   a
	 dec  hl
	 ld   c,$04
	 sub  e
	 cp   (hl)
	 dec  hl
	 dec  bc
	 sub  h
	 and  h
	 pop  de
	 sub  l
	 dec  bc
	 jr   $2BB3
	 ret  pe
	 rst  $38
	 rla
	 ld   (hl),a
	 and  b
	 dec  h
	 inc  bc
	 cp   b
	 dec  hl
	 and  c
	 ld   c,c
	 and  d
	 add  hl,sp
	 add  a,d
	 ld   (hl),$39
	 add  a,d
	 ccf
	 ld   c,$08
	 ld   d,d
	 ld   a,($0E3A)
	 ld   (bc),a
	 sub  h
	 and  h
	 pop  de
	 ex   af,af'
	 ld   b,(hl)
	 cp   e
	 dec  hl
	 ld   c,$04
	 sbc  a,c
	 ld   b,(hl)
	 cp   a
	 dec  hl
	 dec  b
	 ld   b,$CF
	 ld   hl,($7156)
	 ld   d,a
	 and  e
	 dec  de
	 jp   nc,$0B17
	 sub  h
	 and  h
	 pop  de
	 ld   c,$05
	 ld   d,$1B
	 rst  $10
	 rla
	 dec  bc
	 sub  h
	 xor  c
	 pop  de
	 ld   c,$05
	 ld   d,$0E
	 jr   c,$2BEB
	 inc  bc
	 sub  h
	 xor  c
	 pop  de
	 ex   af,af'
	 ld   c,$1D
	 ld   c,$02
	 sub  h
	 and  h
	 pop  de
	 ex   af,af'
	 dec  de
	 jr   $2BC1
	 dec  h
	 daa
	 inc  bc
	 di
	 dec  hl
	 dec  (hl)
	 dec  de
	 jr   $2BCA
	 ld   b,e
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 jr   nz,$2C29
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 rra
	 inc  l
	 dec  de
	 sbc  a,c
	 pop  de
	 dec  e
	 and  h
	 and  l
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 and  l
	 dec  de
	 dec  e
	 call nc,$0325
	 ld   e,$2C
	 dec  de
	 sbc  a,c
	 pop  de
	 dec  h
	 inc  bc
	 ld   e,$2C
	 and  h
	 ld   e,b
	 ld   a,b
	 inc  bc
	 jp   c,$362B
	 sub  c
	 ld   b,$CF
	 ld   (hl),$A6
	 add  a,d
	 and  a
	 ld   (hl),$A8
	 add  a,d
	 xor  c
	 ld   c,$85
	 ld   h,b
	 dec  de
	 ld   a,e
	 rst  $38
	 ld   h,c
	 ld   c,$56
	 ld   e,(hl)
	 dec  de
	 xor  d
	 rst  $38
	 ld   e,a
	 ld   l,c
	 ld   c,$19
	 ld   (hl),h
	 xor  d
	 ld   h,d
	 ld   l,d
	 ld   e,c
	 dec  de
	 adc  a,e
	 rla
	 ld   l,e
	 ld   c,$1E
	 ld   c,a
	 ld   b,$8A
	 rst  $08
	 ld   hl,($0C0E)
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 dec  bc
	 xor  c
	 dec  de
	 ret  z
	 inc  h
	 ld   e,h
	 ld   d,a
	 ld   l,d
	 sbc  a,e
	 dec  e
	 dec  (hl)
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 xor  h
	 inc  l
	 ld   c,$84
	 rla
	 dec  bc
	 jr   $2C17
	 add  a,d
	 and  a
	 sbc  a,d
	 ld   c,c
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   a,h
	 inc  l
	 dec  de
	 ld   d,l
	 pop  de
	 xor  h
	 xor  l
	 ld   (hl),b
	 xor  (hl)
	 ld   l,e
	 add  hl,de
	 sbc  a,e
	 ld   a,c
	 ld   c,$18
	 ld   a,l
	 ld   l,h
	 sbc  a,d
	 dec  e
	 ld   a,d
	 sbc  a,e
	 dec  h
	 ld   d,h
	 inc  bc
	 sub  l
	 inc  l
	 xor  a
	 ld   l,h
	 ld   b,(hl)
	 xor  d
	 inc  l
	 adc  a,(hl)
	 xor  l
	 dec  bc
	 ld   a,l
	 ld   l,h
	 ld   (hl),c
	 dec  de
	 ret
	 out  ($55),a
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   l,h
	 ld   h,d
	 ld   l,l
	 ld   a,b
	 inc  bc
	 ld   d,l
	 inc  l
	 ld   (hl),$7C
	 ld   b,$CF
	 ld   hl,($0C0E)
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 dec  bc
	 and  a
	 dec  de
	 pop  de
	 inc  h
	 ld   e,h
	 ld   d,a
	 ld   l,d
	 sbc  a,(hl)
	 dec  e
	 dec  (hl)
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 inc  de
	 dec  l
	 dec  bc
	 rla
	 dec  de
	 xor  e
	 rst  $38
	 jr   $2CEC
	 sbc  a,h
	 pop  de
	 inc  c
	 xor  c
	 sbc  a,l
	 ld   c,c
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ex   (sp),hl
	 inc  l
	 dec  de
	 ld   d,l
	 pop  de
	 xor  h
	 xor  l
	 ld   (hl),b
	 xor  (hl)
	 ld   l,e
	 sbc  a,(hl)
	 ld   a,c
	 dec  de
	 ret  pe
	 rst  $38
	 ld   a,a
	 ld   l,h
	 sbc  a,l
	 dec  e
	 ld   a,d
	 sbc  a,(hl)
	 dec  h
	 ld   d,h
	 inc  bc
	 call m,$AF2C
	 ld   l,h
	 ld   b,(hl)
	 ld   de,$8E2D
	 xor  l
	 dec  bc
	 ld   a,a
	 ld   l,h
	 ld   (hl),c
	 dec  de
	 ret
	 out  ($55),a
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   l,h
	 ld   h,d
	 ld   l,l
	 ld   a,b
	 inc  bc
	 cp   c
	 inc  l
	 ld   (hl),$7C
	 ld   b,$CF
	 ld   hl,($0C0E)
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 dec  bc
	 xor  c
	 dec  de
	 ret  z
	 inc  h
	 ld   e,h
	 ld   d,a
	 ld   l,d
	 and  c
	 dec  e
	 dec  (hl)
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 ld   (hl),a
	 dec  l
	 dec  de
	 ld   a,h
	 rst  $38
	 rla
	 dec  bc
	 jr   $2CE3
	 and  a
	 and  b
	 ld   c,c
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   b,a
	 dec  l
	 dec  de
	 ld   d,l
	 pop  de
	 xor  h
	 xor  l
	 ld   (hl),b
	 xor  (hl)
	 ld   l,e
	 and  c
	 ld   a,c
	 dec  de
	 ret  pe
	 rst  $38
	 ld   a,l
	 ld   l,h
	 and  b
	 dec  e
	 ld   a,d
	 and  c
	 dec  h
	 ld   d,h
	 inc  bc
	 ld   h,b
	 dec  l
	 xor  a
	 ld   l,h
	 ld   b,(hl)
	 ld   (hl),l
	 dec  l
	 adc  a,(hl)
	 xor  l
	 dec  bc
	 ld   a,l
	 ld   l,h
	 ld   (hl),c
	 dec  de
	 ret
	 out  ($55),a
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   l,h
	 ld   h,d
	 ld   l,l
	 ld   a,b
	 inc  bc
	 jr   nz,$2DA7
	 ld   (hl),$7C
	 ld   b,$CF
	 ld   hl,($0C0E)
	 ld   h,l
	 ld   d,(hl)
	 ld   (hl),c
	 dec  bc
	 and  a
	 dec  de
	 pop  de
	 inc  h
	 ld   e,h
	 ld   d,a
	 ld   l,d
	 sub  a
	 dec  e
	 dec  (hl)
	 ld   a,b
	 ld   c,(hl)
	 daa
	 inc  bc
	 dec  ixl
	 dec  bc
	 rla
	 ld   c,$55
	 jr   $2DB6
	 sbc  a,h
	 pop  de
	 inc  c
	 add  a,d
	 xor  c
	 sub  (hl)
	 ld   c,c
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 xor  (hl)
	 dec  l
	 dec  de
	 ld   d,l
	 pop  de
	 xor  h
	 xor  l
	 ld   (hl),b
	 xor  (hl)
	 ld   l,e
	 sub  a
	 ld   a,c
	 ld   c,$18
	 ld   a,a
	 ld   l,h
	 sub  (hl)
	 dec  e
	 ld   a,d
	 sub  a
	 dec  h
	 ld   d,h
	 inc  bc
	 add  a,$2D
	 xor  a
	 ld   l,h
	 ld   b,(hl)
	 in   a,($2D)
	 adc  a,(hl)
	 xor  l
	 dec  bc
	 ld   a,a
	 ld   l,h
	 ld   (hl),c
	 dec  de
	 ret
	 out  ($55),a
	 ld   e,b
	 ld   (hl),b
	 dec  de
	 ret
	 dec  e
	 ld   l,e
	 ld   c,$26
	 ld   c,a
	 ld   l,h
	 ld   h,d
	 ld   l,l
	 ld   a,b
	 inc  bc
	 add  a,h
	 dec  l
	 ld   (hl),$7C
	 ld   b,$CF
	 ld   hl,($6771)
	 ld   d,a
	 dec  (hl)
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 call nz,$562E
	 dec  de
	 sbc  a,d
	 pop  de
	 ld   c,c
	 sbc  a,e
	 ld   c,c
	 and  c
	 ld   c,c
	 sub  a
	 ld   c,c
	 sbc  a,(hl)
	 ld   c,c
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 add  hl,bc
	 ld   c,h
	 daa
	 inc  bc
	 rrca
	 ld   l,$1B
	 inc  bc
	 ret  nc
	 add  hl,hl
	 dec  de
	 ld   d,l
	 pop  de
	 scf
	 ld   c,$06
	 dec  de
	 dec  l
	 call nc,$9808
	 ld   d,l
	 sbc  a,a
	 ld   d,l
	 and  d
	 ld   d,l
	 sbc  a,h
	 ld   d,l
	 dec  de
	 or   l
	 pop  de
	 ld   d,l
	 dec  de
	 ld   c,l
	 jp   nc,$7255
	 ld   (hl),e
	 ld   d,b
	 dec  de
; The threaded base-render script embeds object-record pointers at these
; locations:
;   $2E29, $2E49  LASER_BASE_BODY_DESTROY
;   $2E39, $2EC6  LASER_BASE_BODY
;   $2E78, $2EA2  LASER_BASE_DESTROY_3
	 ld   e,(hl)
	 jr   $2DC1
	 and  l
	 halt
	 and  l
	 ld   (hl),a
	 and  l
	 add  hl,de
	 and  l
	 ld   a,(de)
	 ld   c,$09
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 call c,$9517
	 and  l
	 halt
	 and  l
	 ld   (hl),a
	 and  l
	 add  hl,de
	 and  l
	 ld   a,(de)
	 ld   c,$09
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   e,(hl)
	 jr   $2DE1
	 and  l
	 halt
	 and  l
	 ld   (hl),a
	 and  l
	 add  hl,de
	 and  l
	 ld   a,(de)
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$10
	 or   b
	 ld   (hl),e
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$12
	 or   b
	 ld   (hl),e
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$16
	 or   b
	 ld   (hl),e
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$20
	 or   b
	 ld   (hl),e
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$10
	 or   b
	 ld   (hl),e
	 ld   (hl),d
	 ld   (hl),e
	 ld   c,$12
	 or   b
	 ld   (hl),e
	 sub  b
	 dec  de
	 dec  l
	 call nc,$2725
	 inc  bc
	 ld   a,b
	 ld   l,$1B
	 ld   de,$25D0
	 dec  de
	 ld   (de),a
	 ret  nc
	 rrca
	 dec  h
	 daa
	 inc  bc
	 sub  h
	 ld   l,$1B
	 add  a,b
	 ld   bc,$9646
	 ld   l,$0E
	 ld   h,b
	 ld   c,a
	 dec  de
	 and  e
	 pop  de
	 ld   a,c
	 ld   (hl),e
	 ld   c,$06
	 dec  de
	 ld   l,$D4
	 ex   af,af'
	 sub  b
	 dec  de
	 ld   l,$D4
	 dec  h
	 daa
	 inc  bc
	 and  d
	 ld   l,$98
	 or   c
	 sbc  a,a
	 or   d
	 dec  de
	 ld   c,l
	 jp   nc,$A292
	 or   e
	 sbc  a,h
	 or   h
	 dec  de
	 or   l
	 pop  de
	 or   l
	 dec  (hl)
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 cp   e
	 ld   l,$B6
	 dec  de
	 call c,$9517
	 and  l
	 halt
	 and  l
	 ld   (hl),a
	 and  l
	 add  hl,de
	 and  l
	 ld   a,(de)
	 dec  bc
	 inc  bc
	 ret  pe
	 dec  l
	 ld   b,$CF
	 ld   hl,($080E)
	 ld   h,l
	 ld   d,(hl)
	 ld   e,c
	 ld   (hl),c
	 ld   d,a
	 dec  (hl)
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 cp   $2E
	 ld   h,d
	 ld   d,a
	 dec  de
	 adc  a,e
	 rla
	 ld   l,e
	 ld   c,$1E
	 ld   c,a
	 ld   l,h
	 ld   l,d
	 dec  (hl)
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 jp   p,$462E
	 ld   h,d
	 cpl
	 dec  de
	 adc  a,d
	 pop  de
	 dec  h
	 add  hl,bc
	 sub  e
	 inc  de
	 cpl
	 dec  bc
	 rla
	 ld   c,$10
	 jr   $2F27
; The threaded alien-render script selects ALIEN_SHIP_HORIZONTAL at $2F0C and
; $2F31, and ALIEN_SHIP_VERTICAL at $2F1E and $2F40.
	 cp   c
	 rla
	 ld   a,(de)
	 add  hl,de
	 ld   b,(hl)
	 ld   b,h
	 cpl
	 ld   c,$02
	 sub  e
	 dec  h
	 cpl
	 ld   c,$10
	 rla
	 dec  bc
	 jr   $2F39
	 sbc  a,l
	 rla
	 ld   (hl),a
	 add  hl,de
	 ld   b,(hl)
	 ld   b,h
	 cpl
	 ld   c,$03
	 sub  e
	 jr   c,$2F59
	 dec  bc
	 rla
	 dec  de
	 ret  p
	 rst  $38
	 jr   $2F4C
	 cp   c
	 rla
	 ld   a,(de)
	 halt
	 ld   b,(hl)
	 ld   b,h
	 cpl
	 dec  b
	 dec  de
	 ret  p
	 rst  $38
	 rla
	 dec  bc
	 jr   $2F5B
	 sbc  a,l
	 rla
	 ld   a,(de)
	 add  hl,de
	 sub  l
	 and  l
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 dec  de
	 adc  a,c
	 pop  de
	 dec  h
	 dec  de
	 adc  a,d
	 pop  de
	 dec  h
	 ld   b,h
	 ld   c,h
	 inc  bc
	 ld   e,c
	 cpl
	 dec  (hl)
	 dec  de
	 adc  a,c
	 pop  de
	 dec  h
	 dec  de
	 adc  a,d
	 pop  de
	 ex   af,af'
	 ld   l,l
	 dec  bc
	 inc  bc
	 ret  po
	 ld   l,$06
	 in   a,($10)
	 bit  2,a
	 jp   nz,$300A
	 ld   d,a
	 ld   e,$FF
	 ld   hl,$0002
	 exx
	 exx
	 ld   a,e
	 exx
	 ld   hl,$4000
	 ld   de,$4001
	 ld   bc,$3FFF
	 ld   (hl),a
	 ldir
	 in   a,($10)
	 exx
	 cp   d
	 exx
	 jp   z,$2F90
	 xor  a
	 jp   $2FAC
	 ld   a,(hl)
	 exx
	 cp   e
	 jp   z,$2FA5
	 inc  hl
	 inc  hl
	 exx
	 inc  a
	 out  ($00),a
	 out  ($04),a
	 dec  de
	 ld   a,d
	 or   e
	 jp   nz,$2F99
	 exx
	 ld   a,e
	 cpl
	 ld   e,a
	 dec  hl
	 ld   a,l
	 or   h
	 exx
	 jp   nz,$2F75
	 exx
	 di
	 xor  a
	 ld   i,a
	 in   a,($10)
	 ld   d,a
	 ld   e,$FF
	 ld   hl,$0002
	 exx
	 ld   hl,$D000
	 ld   de,$D001
	 ld   bc,$07FF
	 ld   a,$A5
	 out  ($5B),a
	 exx
	 ld   a,e
	 exx
	 ld   (hl),a
	 ld   a,(hl)
	 ex   af,af'
	 ld   a,$A5
	 out  ($5B),a
	 ex   af,af'
	 ld   (de),a
	 inc  de
	 inc  hl
	 dec  bc
	 ld   a,b
	 or   c
	 jp   nz,$2FCE
	 in   a,($10)
	 exx
	 cp   d
	 exx
	 jp   z,$2FEA
	 xor  a
	 jp   $3006
	 ld   a,(hl)
	 exx
	 cp   e
	 jp   z,$2FFF
	 inc  hl
	 inc  hl
	 exx
	 inc  a
	 out  ($00),a
	 out  ($04),a
	 dec  de
	 ld   a,d
	 or   e
	 jp   nz,$2FF3
	 exx
	 ld   a,e
	 cpl
	 ld   e,a
	 dec  hl
	 ld   a,l
	 or   h
	 exx
	 jp   nz,$2FBD
	 exx
	 jp   (iy)
	 exx
	 pop  hl
	 exx
	 push bc
	 ld   a,$10
	 out  ($0C),a
	 exx
	 push hl
	 call $1248
	 exx
	 pop  hl
	 exx
	 ld   a,$0F
	 and  d
	 exx
	 ld   d,a
	 exx
	 ld   a,$03
	 and  l
	 jp   nz,$302D
	 ld   a,$03
	 jp   $3041
	 dec  a
	 jp   nz,$3036
	 ld   a,$0C
	 jp   $3041
	 dec  a
	 jp   nz,$303F
	 ld   a,$30
	 jp   $3041
	 ld   a,$C0
	 ld   c,a
	 and  h
	 jp   nz,$3048
	 ld   a,c
	 and  e
	 exx
	 ld   (hl),a
	 ld   a,$89
	 add  a,d
	 ld   d,a
	 inc  hl
	 dec  d
	 jp   nz,$304E
	 ex   de,hl
	 ld   hl,$7E7D
	 or   a
	 sbc  hl,de
	 ex   de,hl
	 exx
	 jp   nc,$3014
	 pop  bc
	 jp   (iy)
	 ld   hl,$0000
	 in   a,($12)
	 bit  5,a
	 jp   nz,$3074
	 ld   a,($D011)
	 or   a
	 jp   z,$3074
	 inc  hl
	 ld   a,l
	 ret
	 call $3062
	 push hl
	 jp   (iy)
	 rst  $08
	 sub  l
	 ld   h,l
	 or   a
	 inc  bc
	 adc  a,h
	 jr   nc,$3006
	 inc  b
	 add  a,d
	 inc  b
	 halt
	 ld   (hl),a
	 ld   b,(hl)
	 adc  a,l
	 jr   nc,$30E5
	 jr   $30A6
	 cp   b
	 ld   b,$CF
	 ld   c,$40
	 ld   d,h
	 ld   b,$11
	 ld   b,b
	 jr   nz,$30CB
	 add  hl,sp
	 jr   c,$30CD
	 jr   nz,$30EC
	 ld   c,c
	 ld   b,h
	 ld   d,a
	 ld   b,c
	 ld   e,c
	 jr   nz,$30F3
	 ld   b,(hl)
	 ld   b,a
	 dec  b
	 ld   d,e
	 ld   d,b
	 ld   b,c
	 ld   b,e
	 ld   b,l
	 inc  bc
	 ld   e,d
	 ld   b,c
	 ld   d,b
	 rst  $08
	 dec  de
	 sub  b
	 rst  $38
	 ld   c,$0A
	 inc  de
	 inc  bc
	 pop  bc
	 jr   nc,$3113
	 ld   b,c
	 ld   b,(hl)
	 call nz,$B630
	 ld   c,$0C
	 ld   c,$0C
	 ld   c,h
	 cp   c
	 dec  de
	 xor  b
	 jr   nc,$3086
	 ld   b,$CF
	 ld   c,$20
	 ld   c,$0A
	 inc  de
	 inc  bc
	 in   a,($30)
	 ld   d,(hl)
	 ld   b,c
	 ld   b,(hl)
	 sbc  a,$30
	 or   (hl)
	 ld   c,$0C
	 ld   c,$0C
	 ld   c,h
	 cp   c
	 dec  de
	 xor  (hl)
	 jr   nc,$30A0
	 ld   b,$CF
	 dec  c
	 cp   e
	 cp   h
	 ld   b,$0C
	 ld   c,c
	 ld   c,(hl)
	 ld   d,e
	 ld   b,l
	 ld   d,d
	 ld   d,h
	 jr   nz,$3138
	 ld   c,a
	 ld   c,c
	 ld   c,(hl)
	 ld   d,e
	 add  hl,bc
	 ld   b,c
	 ld   b,h
	 ld   b,h
	 jr   nz,$3142
	 ld   c,a
	 ld   c,c
	 ld   c,(hl)
	 ld   d,e
	 inc  c
	 ld   b,(hl)
	 ld   c,a
	 ld   d,d
	 jr   nz,$313B
	 jr   nz,$315B
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 ld   (bc),a
	 ld   c,a
	 ld   d,d
	 dec  d
	 ld   d,b
	 ld   d,l
	 ld   d,e
	 ld   c,b
	 jr   nz,$314B
	 jr   nz,$316C
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 jr   nz,$3177
	 ld   c,a
	 jr   nz,$3176
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 rlca
	 ld   b,h
	 ld   b,l
	 ld   d,b
	 ld   c,a
	 ld   d,e
	 ld   c,c
	 ld   d,h
	 rrca
	 ld   b,c
	 ld   b,h
	 ld   b,h
	 ld   c,c
	 ld   d,h
	 ld   c,c
	 ld   c,a
	 ld   c,(hl)
	 ld   b,c
	 ld   c,h
	 jr   nz,$3181
	 ld   c,a
	 ld   c,c
	 ld   c,(hl)
	 rst  $08
	 ld   c,(hl)
	 inc  bc
	 ld   a,d
	 ld   sp,$4409
	 inc  bc
	 ld   h,h
	 ld   sp,$D41B
	 rst  $38
	 ld   c,$42
	 ld   c,$08
	 dec  de
	 add  hl,hl
	 ld   sp,$1BBA
	 or   h
	 rst  $38
	 ld   c,$34
	 ld   c,$08
	 dec  de
	 ld   sp,$BA31
	 ld   b,(hl)
	 ld   a,d
	 ld   sp,$CC1B
	 rst  $38
	 ld   c,$42
	 ld   c,$08
	 dec  de
	 ld   sp,hl
	 jr   nc,$3129
	 dec  de
	 ret  nz
	 rst  $38
	 ld   c,$34
	 ld   c,$08
	 dec  de
	 inc  bc
	 ld   sp,$06BA
	 rst  $08
	 dec  de
	 ret  pe
	 rst  $38
	 ld   c,$26
	 ld   d,(hl)
	 ld   c,$08
	 dec  de
	 djnz $31B8
	 cp   d
	 ld   b,$CF
	 dec  de
	 sbc  a,h
	 rst  $38
	 ld   c,$18
	 ld   d,(hl)
	 ld   c,$08
	 dec  de
	 inc  de
	 ld   sp,$06BA
	 ex   af,af'
	 ld   c,b
	 ld   c,c
	 jr   nz,$31EF
	 ld   b,e
	 ld   c,a
	 ld   d,d
	 ld   b,l
	 ex   af,af'
	 ld   d,b
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 jr   nz,$31DA
	 ex   af,af'
	 ld   d,b
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 jr   nz,$31E4
	 rlca
	 ld   b,e
	 ld   d,d
	 ld   b,l
	 ld   b,h
	 ld   c,c
	 ld   d,h
	 ld   d,e
	 dec  b
	 ld   b,d
	 ld   b,c
	 ld   d,e
	 ld   b,l
	 ld   d,e
	 ld   a,(bc)
	 ld   b,d
	 ld   c,a
	 ld   c,(hl)
	 ld   d,l
	 ld   d,e
	 jr   nz,$320A
	 ld   b,c
	 ld   d,e
	 ld   b,l
	 rst  $08
	 inc  c
	 dec  bc
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 ld   c,$05
	 cp   l
	 ld   c,$30
	 ld   c,$06
	 sub  h
	 xor  (hl)
	 pop  de
	 ex   af,af'
	 ld   c,$06
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 ex   af,af'
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 dec  c
	 cp   (hl)
	 cp   d
	 ld   b,$CF
	 dec  bc
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 ld   c,$04
	 ld   b,l
	 cp   l
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 ex   af,af'
	 dec  bc
	 sub  h
	 xor  (hl)
	 pop  de
	 cp   d
	 ld   b,$CF
	 inc  b
	 dec  h
	 cp   a
	 ld   b,$CF
	 dec  de
	 ld   l,d
	 rst  $38
	 ld   c,$55
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 dec  d
	 ret  nc
	 ret  nz
	 ld   b,$CF
	 dec  de
	 ld   l,d
	 rst  $38
	 ld   c,$39
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 rla
	 ret  nc
	 ret  nz
	 ld   b,$CF
	 ld   c,$6E
	 dec  de
	 xor  h
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 rlca
	 ret  nc
	 ld   c,$02
	 pop  bc
	 ld   b,$10
	 jr   nz,$3283
	 jr   nz,$327C
	 jr   nz,$3290
	 jr   nz,$325B
	 ld   c,b
	 jr   nz,$3287
	 jr   nz,$3287
	 jr   nz,$328A
	 jr   nz,$324F
	 jr   nz,$328D
	 ld   b,c
	 ld   c,l
	 ld   b,l
	 jr   nz,$329A
	 ld   d,(hl)
	 ld   b,l
	 ld   d,d
	 jr   nz,$3266
	 ld   d,b
	 ld   d,l
	 ld   d,e
	 ld   c,b
	 jr   nz,$3287
	 jr   nz,$32A7
	 ld   d,d
	 jr   nz,$328D
	 jr   nz,$32AD
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 jr   nz,$32AA
	 ld   c,a
	 ld   d,d
	 ld   a,(bc)
	 ld   sp,$5453
	 jr   nz,$32BC
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 ld   a,(bc)
	 ld   ($444E),a
	 jr   nz,$32C7
	 ld   c,h
	 ld   b,c
	 ld   e,c
	 ld   b,l
	 ld   d,d
	 rst  $08
	 dec  de
	 ret  c
	 rst  $38
	 ld   c,$18
	 ld   d,(hl)
	 ld   c,$0C
	 dec  de
	 ld   h,(hl)
	 ld   ($06BA),a
	 rst  $08
	 dec  de
	 ret  c
	 rst  $38
	 ld   c,$18
	 ld   d,(hl)
	 ld   c,$0C
	 dec  de
	 ld   (hl),c
	 ld   ($06BA),a
	 ld   hl,$D41D
	 ld   (hl),$01
	 ld   de,$0352
	 call $12A8
	 ld   de,$015E
	 add  hl,de
	 ret
	 call $329D
	 pop  de
	 add  hl,de
	 push hl
	 jp   (iy)
	 ld   a,($D011)
	 or   a
	 jp   z,$32D1
	 ld   hl,($D017)
	 ld   de,($D420)
	 sbc  hl,de
	 jp   c,$32CE
	 call $3298
	 ld   de,($D017)
	 add  hl,de
	 ld   ($D420),hl
	 jp   $32E8
	 ld   hl,($D015)
	 ld   de,($D41E)
	 sbc  hl,de
	 jp   c,$32E8
	 call $3298
	 ld   de,($D015)
	 add  hl,de
	 ld   ($D41E),hl
	 jp   (iy)
	 pop  hl
	 ld   de,($D428)
	 or   a
	 sbc  hl,de
	 jp   c,$332C
	 ld   de,$1388
	 sbc  hl,de
	 ld   hl,$D42B
	 jp   c,$3302
	 ld   (hl),$01
	 dec  (hl)
	 jp   nz,$332C
	 ld   (hl),$05
	 ld   hl,$D42A
	 ld   a,(hl)
	 or   a
	 jp   z,$3316
	 sub  $08
	 ld   (hl),a
	 jp   $3318
	 ld   a,$08
	 ld   hl,($D428)
	 ld   de,$09C4
	 add  hl,de
	 ld   ($D428),hl
	 ld   hl,($D19C)
	 ld   e,a
	 ld   d,$00
	 add  hl,de
	 ld   ($D19C),hl
	 jp   (iy)
	 rst  $08
	 dec  de
	 ld   bc,$25D0
	 dec  de
	 di
	 call nc,$4C4B
	 daa
	 inc  bc
	 ld   d,a
	 inc  sp
	 dec  de
	 ld   a,d
	 rst  $38
	 dec  de
	 xor  h
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 ld   de,$25D0
	 inc  bc
	 ld   d,d
	 inc  sp
	 dec  de
	 inc  de
	 ret  nc
	 ld   b,(hl)
	 ld   d,l
	 inc  sp
	 dec  de
	 ld   (de),a
	 ret  nc
	 add  hl,bc
	 pop  bc
	 ld   b,$CF
	 inc  c
	 ld   c,$08
	 dec  bc
	 inc  hl
	 dec  c
	 dec  de
	 db   $dd,$05
	 jp   nz,$0327
	 ld   l,e
	 inc  sp
	 jp   $6E46
	 inc  sp
	 inc  b
	 dec  d
	 inc  b
	 dec  de
	 call c,$3F05
	 ld   h,$05
	 inc  b
	 ex   af,af'
	 ld   b,$CF
	 ld   hl,($1E0E)
	 call nz,$050E
	 dec  de
	 dec  hl
	 call nc,$C508
	 dec  de
	 dec  e
	 call nc,$0325
	 sbc  a,h
	 inc  sp
	 dec  de
	 sub  d
	 pop  de
	 ld   c,$08
	 dec  de
	 dec  d
	 ret  nc
	 add  a,$1B
	 sub  e
	 pop  de
	 ld   c,$08
	 dec  de
	 rla
	 ret  nc
	 add  a,$1B
	 ld   de,$25D0
	 inc  bc
	 xor  e
	 inc  sp
	 rst  $00
	 dec  de
	 rla
	 ret  nc
	 inc  c
	 ld   b,(hl)
	 or   b
	 inc  sp
	 ret  z
	 dec  de
	 dec  d
	 ret  nc
	 inc  c
	 ret
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 add  a,d
	 inc  sp
	 dec  (hl)
	 dec  bc
	 inc  bc
	 ld   a,h
	 inc  sp
	 ld   b,$CF
	 ld   c,$5C
	 ld   c,$55
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 dec  e
	 ret  nc
	 ret  nz
	 ld   c,$5C
	 ld   c,$47
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 rra
	 ret  nc
	 ret  nz
	 ld   c,$5C
	 ld   c,$39
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 ld   hl,$C0D0
	 dec  de
	 ld   h,d
	 rst  $38
	 ld   c,$63
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 and  b
	 ld   sp,$C8BA
	 dec  de
	 djnz $33C3
	 dec  h
	 inc  bc
	 inc  b
	 inc  (hl)
	 dec  de
	 ld   h,d
	 rst  $38
	 ld   c,$47
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 xor  c
	 ld   sp,$C7BA
	 ld   b,$ED
	 ld   e,e
	 ld   h,$D4
	 ld   hl,$1130
	 sbc  hl,de
	 jp   nc,$3414
	 ld   de,$1130
	 ld   e,d
	 ld   d,$00
	 rl   e
	 rl   e
	 pop  hl
	 or   a
	 sbc  hl,de
	 ld   de,$0005
	 add  hl,de
	 ld   a,h
	 or   a
	 jp   p,$342B
	 ld   hl,$0002
	 ld   a,l
	 cp   $02
	 jp   nc,$3433
	 ld   a,$02
	 ld   ($D18B),a
	 ld   hl,$D423
	 ld   a,($D422)
	 or   a
	 jp   nz,$3445
	 ld   (hl),$01
	 jp   $344C
	 cp   $40
	 jp   nz,$344C
	 ld   (hl),$FF
	 add  a,(hl)
	 ld   ($D422),a
	 jp   (iy)
	 rst  $08
	 ld   hl,($120E)
	 call nz,$500E
	 dec  de
	 ld   ($25D4),hl
	 jp   z,$09CB
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   e,a
	 inc  (hl)
	 dec  bc
	 inc  bc
	 ld   d,a
	 inc  (hl)
	 ld   b,$CF
	 dec  de
	 inc  h
	 ret  nc
	 dec  h
	 inc  bc
	 and  c
	 inc  (hl)
	 dec  de
	 ld   bc,$25D0
	 inc  bc
	 and  c
	 inc  (hl)
	 dec  de
	 ld   b,$D0
	 dec  h
	 inc  bc
	 adc  a,l
	 inc  (hl)
	 dec  de
	 jr   nc,$345C
	 ld   c,c
	 add  hl,bc
	 ld   b,(hl)
	 and  b
	 inc  (hl)
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 add  hl,bc
	 ld   b,h
	 inc  bc
	 sbc  a,a
	 inc  (hl)
	 dec  de
	 cpl
	 call nc,$0E49
	 ld   (bc),a
	 ld   b,(hl)
	 and  b
	 inc  (hl)
	 dec  bc
	 call z,$CF06
	 ld   hl,($CF06)
	 ld   hl,($070E)
	 call nz,$BB09
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 add  hl,bc
	 cp   h
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 inc  bc
	 xor  d
	 inc  (hl)
	 dec  bc
	 call $CF06
	 dec  bc
	 dec  de
	 nop
	 ld   b,b
	 dec  de
	 add  a,b
	 ld   a,$22
	 dec  de
	 cpl
	 call nc,$061C
	 rst  $08
	 ld   hl,($050E)
	 call nz,$1B35
	 ld   bc,$25D0
	 inc  bc
	 ld   e,$35
	 ld   b,c
	 add  hl,bc
	 ld   c,h
	 ld   c,$02
	 rrca
	 ld   c,a
	 ld   (hl),e
	 ld   b,c
	 ld   c,$03
	 ld   c,h
	 inc  d
	 dec  c
	 dec  de
	 adc  a,c
	 pop  de
	 dec  h
	 ld   b,h
	 daa
	 inc  bc
	 ei
	 inc  (hl)
	 dec  de
	 adc  a,c
	 pop  de
	 ex   af,af'
	 dec  de
	 ld   bc,$55D2
	 ld   b,(hl)
	 call m,$0534
	 dec  de
	 or   l
	 pop  de
	 ld   d,l
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 or   l
	 pop  de
	 ld   d,l
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 inc  bc
	 rla
	 dec  (hl)
	 adc  a,(hl)
	 ld   c,$04
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ret
	 out  ($55),a
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 exx
	 inc  (hl)
	 dec  (hl)
	 ld   b,$CD
	 ld   c,b
	 ld   (de),a
	 ld   a,l
	 add  a,h
	 and  $03
	 inc  a
	 ld   ($D188),a
	 ld   a,($D18B)
	 rra
	 ex   af,af'
	 ld   hl,$D18C
	 ld   a,d
	 add  a,e
	 and  $07
	 jp   nz,$353D
	 ex   af,af'
	 xor  a
	 ex   af,af'
	 ex   af,af'
	 ld   (hl),a
	 jp   (iy)
	 rst  $08
	 inc  c
	 dec  c
	 dec  de
	 dec  e
	 ret  nc
	 inc  c
	 jp   nz,$6403
	 dec  (hl)
	 dec  de
	 rra
	 ret  nc
	 inc  c
	 dec  de
	 ld   hl,$CED0
	 dec  de
	 dec  e
	 ret  nc
	 inc  c
	 dec  de
	 rra
	 ret  nc
	 adc  a,$1B
	 dec  e
	 ret  nc
	 adc  a,$09
	 ld   b,(hl)
	 sub  b
	 dec  (hl)
	 dec  c
	 dec  de
	 rra
	 ret  nc
	 inc  c
	 jp   nz,$7D03
	 dec  (hl)
	 dec  de
	 rra
	 ret  nc
	 inc  c
	 dec  de
	 ld   hl,$CED0
	 dec  de
	 rra
	 ret  nc
	 adc  a,$0B
	 ld   b,(hl)
	 sub  b
	 dec  (hl)
	 dec  c
	 dec  de
	 ld   hl,$0CD0
	 jp   nz,$8E03
	 dec  (hl)
	 dec  de
	 ld   hl,$CED0
	 dec  bc
	 ld   b,(hl)
	 sub  b
	 dec  (hl)
	 dec  b
	 dec  bc
	 ld   b,$CF
	 dec  de
	 nop
	 inc  bc
	 dec  de
	 inc  b
	 ret  nc
	 adc  a,$06
	 rst  $08
	 dec  de
	 ld   de,$25D0
	 inc  d
	 add  hl,bc
	 ld   c,h
	 dec  c
	 dec  de
	 ld   de,$47D0
	 dec  de
	 inc  hl
	 ret  nc
	 add  hl,hl
	 dec  de
	 ld   (de),a
	 ret  nc
	 rrca
	 dec  h
	 ld   b,$A4
	 rst  $08
	 ld   c,$11
	 ld   hl,$200E
	 ld   c,h
	 inc  bc
	 pop  bc
	 dec  (hl)
	 ld   c,$03
	 ld   b,(hl)
	 jp   $0E35
	 inc  b
	 ld   b,$CF
	 sbc  a,b
	 ld   c,e
	 sbc  a,a
	 ld   c,e
	 and  d
	 ld   c,e
	 sbc  a,h
	 ld   c,e
	 ld   c,h
	 ld   c,h
	 ld   c,h
	 ld   b,$CF
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 jp   po,$1B35
	 inc  bc
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   d,l
	 pop  de
	 rst  $08
	 ld   b,$CF
	 ret  nc
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 xor  $35
	 jr   z,$35F5
	 rst  $08
	 ld   hl,($030E)
	 call nz,$241B
	 ret  nc
	 dec  h
	 inc  bc
	 ret  nc
	 ld   (hl),$1B
	 ld   (de),a
	 ret  nc
	 ld   c,l
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 inc  bc
	 or   e
	 ld   (hl),$D0
	 dec  de
	 ld   d,h
	 call nc,$1BD1
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 dec  de
	 dec  d
	 ret  nc
	 ld   c,l
	 dec  de
	 rla
	 ret  nc
	 ld   c,l
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 ld   c,$02
	 jp   nc,$3C03
	 ld   (hl),$0B
	 call $981B
	 rst  $38
	 ld   c,$18
	 ld   d,(hl)
	 ld   c,$08
	 dec  de
	 ld   c,a
	 ld   ($D3BA),a
	 sub  b
	 dec  de
	 dec  h
	 call nc,$0325
	 cpl
	 ld   (hl),$09
	 ld   b,(hl)
	 ld   h,d
	 ld   (hl),$D4
	 push de
	 dec  bc
	 call $90D3
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 ld   c,$02
	 jp   nc,$5203
	 ld   (hl),$D5
	 call nc,$4609
	 ld   d,e
	 ld   (hl),$0B
	 dec  de
	 dec  h
	 call nc,$5425
	 inc  bc
	 ld   b,b
	 ld   (hl),$1B
	 rlca
	 ret  nc
	 dec  h
	 ld   c,$02
	 ld   (bc),a
	 inc  bc
	 rla
	 ld   (hl),$0B
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 ld   c,$02
	 jp   nc,$8503
	 ld   (hl),$1B
	 dec  h
	 call nc,$0E25
	 ld   (bc),a
	 jp   nc,$8503
	 ld   (hl),$1B
	 rlca
	 ret  nc
	 ld   d,e
	 sub  $1B
	 inc  de
	 ret  nc
	 ld   b,a
	 dec  b
	 add  hl,bc
	 dec  de
	 djnz $3658
	 ld   b,a
	 dec  de
	 rlca
	 ret  nc
	 ld   d,e
	 dec  de
	 dec  h
	 call nc,$D71D
	 dec  de
	 ld   de,$29D0
	 sub  $1B
	 ld   (de),a
	 ret  nc
	 ld   b,a
	 dec  de
	 ld   bc,$29D0
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 dec  de
	 djnz $3676
	 dec  h
	 daa
	 inc  bc
	 or   b
	 ld   (hl),$D8
	 ld   c,$14
	 ld   c,a
	 ld   (hl),e
	 ld   b,(hl)
	 cp   e
	 ld   (hl),$0E
	 inc  bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 di
	 call nc,$1BD9
	 ld   c,h
	 dec  e
	 dec  de
	 add  hl,de
	 ret  nc
	 adc  a,$1B
	 ld   c,h
	 dec  e
	 dec  de
	 dec  de
	 ret  nc
	 adc  a,$1B
	 ld   sp,$1DD4
	 ld   b,(hl)
	 ex   de,hl
	 ld   (hl),$1B
	 ld   bc,$29D0
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 ret  nc
	 dec  de
	 inc  hl
	 ret  nc
	 dec  h
	 inc  bc
	 ex   de,hl
	 ld   (hl),$DA
	 daa
	 inc  bc
	 ex   de,hl
	 ld   (hl),$1B
	 inc  hl
	 ret  nc
	 ld   c,d
	 jp   c,$1B05
	 inc  hl
	 call nc,$1B49
	 ld   ($1DD4),hl
	 dec  de
	 inc  hl
	 ret  nc
	 add  hl,hl
	 dec  de
	 rla
	 ret  nc
	 inc  c
	 in   a,($1B)
	 jr   nz,$36D3
	 djnz $371C
	 dec  d
	 ret  nc
	 inc  c
	 in   a,($1B)
	 ld   e,$D4
	 djnz $3725
	 dec  e
	 call nc,$D01D
	 dec  de
	 and  e
	 pop  de
	 dec  e
	 call c,$0E0B
	 ld   a,(bc)
	 rra
	 dec  de
	 nop
	 ld   bc,$1B51
	 nop
	 ld   b,b
	 rrca
	 db   $dd,$0e
	 ret  z
	 ld   c,$0A
	 rra
	 or   (hl)
	 sbc  a,$DF
	 rst  $10
	 ret  po
	 ld   c,$58
	 ld   c,$63
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 sub  a
	 ld   sp,$0EBA
	 ld   e,d
	 dec  de
	 cp   d
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 or   d
	 ld   sp,$1BBA
	 ld   l,d
	 rst  $38
	 dec  de
	 cp   d
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 cp   d
	 ld   sp,$1BBA
	 inc  h
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   bc,$25D0
	 daa
	 inc  bc
	 adc  a,d
	 scf
	 ret  nc
	 dec  de
	 djnz $372E
	 dec  h
	 inc  bc
	 adc  a,d
	 scf
	 dec  de
	 ld   de,$25D0
	 inc  bc
	 ld   l,l
	 scf
	 pop  hl
	 ld   b,(hl)
	 ld   l,(hl)
	 scf
	 jp   po,$1B90
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   l,(hl)
	 scf
	 ret  c
	 ret  po
	 ld   l,b
	 ld   c,$28
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   de,$25D0
	 inc  bc
	 adc  a,c
	 scf
	 pop  hl
	 ld   b,(hl)
	 adc  a,d
	 scf
	 jp   po,$4F09
	 ld   (hl),e
	 dec  de
	 and  e
	 pop  de
	 dec  h
	 daa
	 inc  bc
	 jp   z,$0E38
	 ld   h,b
	 dec  de
	 ld   hl,($08D4)
	 ld   c,$90
	 dec  de
	 sbc  a,h
	 pop  de
	 djnz $37BD
	 call nz,$1B09
	 jr   z,$377B
	 djnz $37C4
	 inc  d
	 ret  nc
	 add  hl,hl
	 dec  de
	 ld   h,$D4
	 inc  e
	 dec  de
	 di
	 call nc,$1B55
	 cp   d
	 call nc,$1BE3
	 ret
	 out  ($55),a
	 dec  de
	 ld   bc,$55D2
	 ld   l,b
	 ld   c,$1E
	 ld   c,a
	 ld   (hl),e
	 sub  b
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 push bc
	 scf
	 dec  de
	 ld   c,l
	 jp   nc,$034B
	 xor  e
	 jr   c,$37F1
	 inc  bc
	 ret  nc
	 dec  h
	 add  hl,bc
	 ld   b,h
	 inc  bc
	 jp   po,$0937
	 ld   b,(hl)
	 ex   (sp),hl
	 scf
	 dec  bc
	 dec  de
	 ld   bc,$25D0
	 daa
	 ld   d,h
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   b,a
	 ret  nc
	 dec  de
	 dec  e
	 call nc,$0325
	 ld   a,($9038)
	 call po,$F503
	 scf
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   a,($1B38)
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 inc  d
	 jr   c,$3819
	 ld   (bc),a
	 dec  de
	 inc  bc
	 ret  nc
	 ld   b,a
	 dec  de
	 ld   d,l
	 pop  de
	 push hl
	 ld   c,$05
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   c,l
	 jp   nc,$09E6
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   c,l
	 jp   nc,$1B4B
	 dec  e
	 call nc,$2725
	 ld   c,h
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 ld   d,h
	 inc  bc
	 inc  e
	 jr   c,$3802
	 dec  de
	 dec  e
	 call nc,$0E1D
	 ld   e,$4F
	 ld   (hl),e
	 dec  de
	 ld   bc,$25D0
	 daa
	 dec  de
	 ld   sp,$25D4
	 ld   c,h
	 inc  bc
	 sub  c
	 jr   c,$3818
	 dec  de
	 ld   sp,$1DD4
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 call po,$4C03
	 jr   c,$3862
	 inc  c
	 dec  de
	 dec  d
	 call nc,$1B08
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   l,c
	 jr   c,$387D
	 inc  bc
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   d,l
	 pop  de
	 rst  $20
	 ret  po
	 ret  nc
	 dec  de
	 ret  c
	 rst  $38
	 dec  de
	 out  ($FF),a
	 ld   d,(hl)
	 ld   c,$0C
	 dec  de
	 ret  nz
	 ld   sp,$68BA
	 ld   c,$0A
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 dec  d
	 call nc,$1B43
	 dec  d
	 call nc,$2725
	 inc  bc
	 ld   l,d
	 jr   c,$3898
	 inc  d
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   ($1DD4),hl
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 xor  e
	 jr   c,$38B5
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 and  l
	 jr   c,$38BD
	 ld   d,l
	 pop  de
	 ret  pe
	 jp   (hl)
	 dec  de
	 ld   c,l
	 jp   nc,$D055
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 inc  bc
	 adc  a,$37
	 ret  nc
	 ld   l,b
	 ld   c,$28
	 ld   c,a
	 ld   (hl),e
	 ret  po
	 ret  nc
	 sub  b
	 dec  de
	 ret
	 out  ($4B),a
	 dec  de
	 ld   d,l
	 pop  de
	 ld   c,e
	 ld   c,h
	 inc  bc
	 cp   l
	 jr   c,$38E6
	 add  a,a
	 ret  nc
	 dec  e
	 dec  de
	 ld   bc,$25D0
	 dec  de
	 di
	 call nc,$4C4B
	 inc  bc
	 sbc  a,$38
	 add  hl,bc
	 ld   b,(hl)
	 ld   e,b
	 add  hl,sp
	 ret  nc
	 dec  de
	 cp   d
	 call nc,$0E55
	 ld   e,$4F
	 ld   (hl),e
	 dec  de
	 inc  hl
	 call nc,$1B49
	 ld   ($1DD4),hl
	 jp   c,$F703
	 jr   c,$38FF
	 ld   b,(hl)
	 ld   e,b
	 add  hl,sp
	 dec  de
	 inc  hl
	 ret  nc
	 ld   c,d
	 jp   c,$0303
	 add  hl,sp
	 dec  bc
	 ld   b,(hl)
	 ld   e,b
	 add  hl,sp
	 dec  de
	 dec  d
	 ret  nc
	 jp   pe,$171B
	 ret  nc
	 jp   pe,$0DDF
	 dec  de
	 ld   de,$47D0
	 ld   d,h
	 inc  bc
	 add  hl,sp
	 add  hl,sp
	 sub  b
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 dec  d
	 add  hl,sp
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   d,l
	 pop  de
	 ex   de,hl
	 dec  de
	 ret  nz
	 rst  $38
	 dec  de
	 rst  $30
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 ld   ($BA32),a
	 ld   l,b
	 ret  nc
	 ld   c,$6E
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   b,l
	 add  hl,sp
	 dec  de
	 ld   d,l
	 pop  de
	 rst  $08
	 dec  de
	 call nc,$0EFF
	 dec  b
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 ld   b,e
	 ld   ($1BBA),a
	 ld   de,$29D0
	 or   (hl)
	 sbc  a,$09
	 inc  bc
	 dec  c
	 scf
	 ret  nc
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 ld   l,c
	 add  hl,sp
	 ld   c,$96
	 ld   b,(hl)
	 ld   l,e
	 add  hl,sp
	 ld   c,$32
	 ld   l,b
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 ld   ($55D4),a
	 ld   b,$00
	 dec  b
	 nop
	 inc  bc
	 add  a,b
	 nop
	 nop
	 ld   bc,$B7D9
	 rla
	 ld   hl,$3973
	 ld   e,a
	 ld   d,$00
	 add  hl,de
	 ld   e,(hl)
	 inc  hl
	 ld   d,(hl)
	 ld   hl,($D006)
	 add  hl,de
	 ex   de,hl
	 ld   hl,$D006
	 call $1EBB
	 exx
	 ret
	 exx
	 ld   hl,$D00D
	 ld   e,$01
	 call $1EDE
	 exx
	 ret
	 ld   de,$D155
	 call $1FC3
	 ld   e,$06
	 dec  l
	 jp   nz,$39A8
	 dec  h
	 jp   nz,$39A8
	 dec  e
	 jp   nz,$39A8
	 jp   $0000
	 push af
	 push hl
	 push de
	 push bc
	 ex   af,af'
	 exx
	 push af
	 push hl
	 push de
	 push bc
	 ld   a,($D42C)
	 out  ($04),a
	 ld   a,($D001)
	 or   a
	 jp   nz,$3A41
	 ld   a,($D014)
	 or   a
	 jp   nz,$3A41
	 call $3062
	 ld   hl,$D41A
	 or   a
	 jp   nz,$39E3
	 in   a,($12)
	 jp   $39E5
	 in   a,($11)
	 and  $0F
	 ld   e,a
	 xor  (hl)
	 jp   z,$3A30
	 and  (hl)
	 jp   z,$3A13
	 ld   hl,$D41A
	 ld   (hl),e
	 inc  hl
	 ld   (hl),e
	 inc  hl
	 ld   (hl),$00
	 ld   d,$01
	 bit  0,a
	 jp   nz,$3A0D
	 inc  d
	 bit  3,a
	 jp   nz,$3A0D
	 inc  d
	 bit  1,a
	 jp   nz,$3A0D
	 inc  d
	 jp   $3A32
	 jp   $3A30
	 inc  hl
	 ld   (hl),e
	 ld   a,e
	 cp   $0F
	 jp   z,$3A30
	 inc  hl
	 xor  a
	 cp   (hl)
	 jp   nz,$3A26
	 ld   (hl),$03
	 jp   $3A30
	 dec  (hl)
	 jp   nz,$3A30
	 ld   a,e
	 xor  $0F
	 jp   $39F0
	 ld   d,$00
	 ld   a,d
	 ld   hl,$D189
	 or   a
	 jp   z,$3A3B
	 ld   (hl),a
	 ld   a,(hl)
	 inc  hl
	 cp   (hl)
	 jp   nz,$3A44
	 ld   hl,$0000
	 ld   a,h
	 or   l
	 ld   ($D417),a
	 ld   hl,($D004)
	 ld   de,$0001
	 or   a
	 sbc  hl,de
	 jp   nc,$3A58
	 jp   $0000
	 ld   de,$D004
	 ex   de,hl
	 call $1EBB
	 in   a,($10)
	 bit  3,a
	 jp   nz,$3A71
	 ld   e,$01
	 ld   hl,$D00E
	 call $1EDE
	 jp   $39A0
	 bit  2,a
	 jp   nz,$3A79
	 jp   $39A0
	 ld   b,a
	 in   a,($10)
	 cp   b
	 jp   nz,$3A79
	 ld   hl,$D00F
	 ld   bc,$FFFF
	 xor  (hl)
	 bit  0,a
	 jp   z,$3AB6
	 ex   af,af'
	 ld   a,(hl)
	 bit  0,a
	 jp   z,$3A9D
	 res  0,a
	 ld   e,a
	 call $1EDE
	 ex   af,af'
	 jp   $3AB6
	 set  0,a
	 ld   e,a
	 call $1EDE
	 call $3995
	 exx
	 ld   a,($D00C)
	 ld   b,a
	 ld   c,$13
	 in   a,(c)
	 and  $01
	 or   $02
	 exx
	 ld   c,a
	 ex   af,af'
	 bit  1,a
	 jp   z,$3AF4
	 ex   af,af'
	 ld   a,(hl)
	 bit  1,a
	 jp   z,$3ACC
	 res  1,a
	 ld   e,a
	 call $1EDE
	 ex   af,af'
	 jp   $3AF4
	 set  1,a
	 ld   e,a
	 call $1EDE
	 call $3995
	 exx
	 ld   a,($D00C)
	 ld   c,$13
	 ld   b,a
	 in   a,(c)
	 ld   b,a
	 and  $06
	 rra
	 ld   c,a
	 ld   a,b
	 and  $01
	 or   $02
	 cp   c
	 jp   z,$3AF2
	 ld   a,c
	 exx
	 ld   b,a
	 jp   $3AF4
	 exx
	 ld   c,a
	 ld   a,c
	 cp   $FF
	 jp   z,$3B05
	 call $397B
	 ld   hl,$D009
	 ld   e,(hl)
	 inc  e
	 call $1EDE
	 ld   a,b
	 cp   $FF
	 jp   z,$3B25
	 call $397B
	 cp   c
	 jp   nz,$3B1D
	 ld   hl,$D009
	 ld   e,(hl)
	 inc  e
	 call $1EDE
	 jp   $3B25
	 ld   hl,$D00B
	 ld   e,(hl)
	 inc  e
	 call $1EDE
	 ld   c,$13
	 xor  a
	 ld   b,a
	 ld   hl,$D008
	 cp   (hl)
	 jp   z,$3B43
	 ld   e,(hl)
	 dec  e
	 call $1EDE
	 ld   hl,$D008
	 ld   a,$0A
	 cp   (hl)
	 jp   nc,$3B40
	 set  0,b
	 jp   $3B55
	 inc  hl
	 cp   (hl)
	 jp   z,$3B55
	 ld   e,(hl)
	 dec  e
	 call $1EDE
	 ld   hl,$D008
	 ld   e,$14
	 call $1EDE
	 xor  a
	 ld   hl,$D00A
	 cp   (hl)
	 jp   z,$3B70
	 ld   e,(hl)
	 dec  e
	 call $1EDE
	 ld   hl,$D00A
	 ld   a,$0A
	 cp   (hl)
	 jp   nc,$3B6D
	 set  1,b
	 jp   $3B82
	 inc  hl
	 cp   (hl)
	 jp   z,$3B82
	 ld   e,(hl)
	 dec  e
	 call $1EDE
	 ld   hl,$D00A
	 ld   e,$14
	 call $1EDE
	 in   a,(c)
	 ld   e,b
	 ld   hl,$D00C
	 call $1EDE
	 call $3062
	 or   a
	 jp   nz,$3B97
	 in   a,($12)
	 jp   $3B99
	 in   a,($11)
	 ld   hl,$D419
	 xor  (hl)
	 bit  4,a
	 jp   z,$3BB5
	 bit  4,(hl)
	 jp   z,$3BAE
	 res  4,(hl)
	 ld   d,$01
	 jp   $3BB2
	 set  4,(hl)
	 ld   d,$00
	 jp   $3BB7
	 ld   d,$00
	 ld   a,($D001)
	 ld   l,a
	 ld   a,($D014)
	 or   l
	 ld   hl,$D418
	 jp   z,$3BC9
	 ld   d,$00
	 ld   (hl),$00
	 ld   a,d
	 add  a,(hl)
	 ld   (hl),a
	 pop  bc
	 pop  de
	 pop  hl
	 pop  af
	 exx
	 ex   af,af'
	 pop  bc
	 pop  de
	 pop  hl
	 pop  af
	 jp   $05F2
	 ld   a,($D007)
	 or   a
	 jp   z,$3BFA
	 ld   a,($D001)
	 or   a
	 jp   z,$3BFA
	 in   a,($10)
	 ld   hl,$D425
	 bit  4,a
	 jp   nz,$3BF3
	 ld   (hl),$01
	 bit  5,a
	 jp   nz,$3BFA
	 ld   (hl),$02
	 jp   (iy)
	 rst  $08
	 ld   hl,($C00E)
	 call nz,$540E
	 ld   c,$05
	 rra
	 ld   c,$C5
	 ld   c,$06
	 rra
	 ld   c,$7F
	 ld   c,$07
	 rra
	 ret  nc
	 call c,$DEB6
	 dec  de
	 inc  h
	 ret  nc
	 dec  h
	 inc  bc
	 ld   h,c
	 inc  a
	 rst  $10
	 dec  bc
	 call $AC1B
	 rst  $38
	 ld   c,$5E
	 or   (hl)
	 ld   c,$04
	 dec  de
	 sub  (hl)
	 jr   nc,$3BE4
	 dec  de
	 ret  nz
	 rst  $38
	 dec  de
	 xor  h
	 rst  $38
	 or   (hl)
	 ld   c,$0C
	 dec  de
	 call pe,$BA30
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 inc  bc
	 ld   d,l
	 inc  a
	 dec  de
	 dec  h
	 call nc,$2725
	 inc  bc
	 ld   d,d
	 inc  a
	 dec  de
	 ld   (bc),a
	 ret  nc
	 ld   c,d
	 dec  de
	 inc  bc
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   d,l
	 pop  de
	 call pe,$6146
	 inc  a
	 dec  de
	 ld   d,h
	 call nc,$28ED
	 dec  de
	 ld   (bc),a
	 ret  nc
	 add  hl,hl
	 add  hl,bc
	 ld   c,a
	 ld   (hl),e
	 dec  de
	 sbc  a,b
	 call nc,$35EE
	 dec  bc
	 inc  bc
	 djnz $3CA6
	 ld   b,$CF
	 ld   hl,($171B)
	 call nc,$0325
	 ld   a,b
	 inc  a
	 dec  de
	 ld   bc,$55D2
	 dec  de
	 dec  c
	 ret  nc
	 dec  h
	 inc  bc
	 or   l
	 inc  a
	 dec  de
	 dec  c
	 ret  nc
	 add  hl,hl
	 ld   d,(hl)
	 dec  de
	 cpl
	 call nc,$0325
	 sub  d
	 inc  a
	 ld   c,$02
	 call z,$2F1B
	 call nc,$1B1D
	 jr   nc,$3C69
	 dec  h
	 inc  bc
	 sbc  a,a
	 inc  a
	 add  hl,bc
	 call z,$301B
	 call nc,$B61D
	 sbc  a,$1B
	 ld   bc,$25D0
	 inc  bc
	 xor  h
	 inc  a
	 dec  de
	 and  e
	 pop  de
	 ld   c,c
	 rst  $10
	 dec  de
	 inc  bc
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   d,l
	 pop  de
	 call pe,$1BEF
	 jr   $3C8D
	 dec  h
	 inc  bc
	 push de
	 inc  a
	 dec  de
	 inc  d
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 push de
	 inc  a
	 dec  de
	 or   l
	 pop  de
	 ld   d,l
	 dec  de
	 inc  bc
	 ret  nc
	 dec  h
	 daa
	 inc  bc
	 push de
	 inc  a
	 dec  de
	 ld   d,l
	 pop  de
	 ret  p
	 sub  b
	 dec  bc
	 inc  bc
	 ld   l,l
	 inc  a
	 ld   b,$CF
	 pop  af
	 jp   p,$F4F3
	 dec  de
	 inc  h
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   c,$D0
	 dec  h
	 inc  bc
	 dec  b
	 dec  a
	 dec  de
	 ld   c,$D0
	 add  hl,hl
	 dec  de
	 ld   bc,$4AD0
	 dec  de
	 ld   b,$D0
	 add  hl,hl
	 dec  de
	 rlca
	 ret  nc
	 dec  h
	 inc  bc
	 ld   (bc),a
	 dec  a
	 dec  de
	 rlca
	 ret  nc
	 ld   d,e
	 ld   b,(hl)
	 dec  h
	 dec  a
	 dec  de
	 ld   bc,$25D0
	 daa
	 inc  bc
	 dec  h
	 dec  a
	 dec  de
	 ld   (de),a
	 ret  nc
	 dec  h
	 ld   c,$0D
	 ld   (bc),a
	 inc  bc
	 dec  h
	 dec  a
	 dec  de
	 inc  de
	 ret  nc
	 dec  h
	 ld   c,$0D
	 ld   (bc),a
	 inc  bc
	 dec  h
	 dec  a
	 dec  de
	 inc  h
	 ret  nc
	 add  hl,hl
	 ld   c,$10
	 ld   hl,$040E
	 ld   c,h
	 daa
	 inc  bc
	 ld   l,e
	 dec  a
	 dec  bc
	 ld   c,$09
	 add  hl,bc
	 inc  hl
	 dec  bc
	 dec  de
	 nop
	 ex   af,af'
	 dec  bc
	 inc  hl
	 push af
	 inc  h
	 rrca
	 dec  h
	 rrca
	 ld   c,$10
	 ld   hl,$2605
	 ld   c,$FF
	 ld   c,h
	 ld   c,$FF
	 ld   b,h
	 daa
	 inc  bc
	 ld   h,d
	 dec  a
	 dec  de
	 ld   ($1BD4),a
	 sbc  a,b
	 ret  nc
	 djnz $3D7A
	 dec  c
	 rrca
	 dec  c
	 rrca
	 dec  c
	 rrca
	 dec  bc
	 ld   c,$0C
	 add  hl,bc
	 inc  h
	 cp   a
	 dec  de
	 nop
	 ex   af,af'
	 rrca
	 ld   h,$0B
	 inc  bc
	 ld   h,a
	 dec  a
	 ret  nc
	 di
	 inc  (hl)
	 dec  de
	 adc  a,c
	 pop  de
	 ld   c,c
	 ld   c,$55
	 dec  de
	 adc  a,e
	 pop  de
	 ex   af,af'
	 dec  de
	 ld   bc,$4AD0
	 dec  de
	 inc  l
	 call nc,$1B1D
	 dec  l
	 call nc,$1B1C
	 adc  a,d
	 ret  nc
	 dec  e
	 dec  de
	 adc  a,e
	 ret  nc
	 dec  e
	 dec  de
	 adc  a,h
	 ret  nc
	 dec  e
	 dec  de
	 adc  a,l
	 ret  nc
	 dec  e
	 dec  de
	 adc  a,(hl)
	 ret  nc
	 dec  e
	 ld   c,$3F
	 dec  de
	 add  hl,de
	 call nc,$0E08
	 rrca
	 dec  de
	 ld   a,(de)
	 call nc,$1B08
	 add  a,a
	 ret  nc
	 dec  e
	 dec  de
	 cp   d
	 call nc,$1BD1
	 di
	 call nc,$1BD1
	 sbc  a,b
	 call nc,$98D1
	 or   c
	 sbc  a,a
	 or   d
	 dec  de
	 ret
	 out  ($F6),a
	 sbc  a,h
	 or   h
	 and  d
	 or   e
	 dec  de
	 inc  d
	 ret  nc
	 ld   c,d
	 dec  de
	 ld   c,l
	 jp   nc,$1B92
	 ld   ($F7D4),a
	 dec  de
	 ld   bc,$F8D2
	 dec  de
	 or   l
	 pop  de
	 or   l
	 dec  de
	 call c,$F9D4
	 dec  de
	 ret
	 out  ($F6),a
	 dec  de
	 halt
	 call nc,$1BFA
	 or   a
	 add  hl,sp
	 dec  de
	 add  a,b
	 ret  nc
	 djnz $3DE3
	 ld   b,$F3
	 nop
	 nop
	 adc  a,h
	 nop
	 inc  c
	 ld   bc,$01FC
	 sub  a
	 nop
	 sub  h
	 nop
	 ld   b,h
	 nop
	 inc  (hl)
	 ld   bc,$00B2
	 add  a,c
	 nop
	 ld   e,(hl)
	 ld   (bc),a
	 ld   a,e
	 nop
	 sbc  a,l
	 nop
	 add  a,a
	 nop
	 ld   e,c
	 nop
	 cp   a
	 nop
	 xor  e
	 nop
	 rst  $38
	 rst  $38
	 dec  bc
	 inc  b
	 ex   (sp),hl
	 ld   bc,$00D9
	 call nc,$5F00
	 ld   bc,$10DA
	 call pe,$FC10
	 ld   de,$1207
	 ld   d,b
	 nop
	 or   a
	 nop
	 ld   h,(hl)
	 ld   (bc),a
	 ld   a,(hl)
	 ld   (bc),a
	 pop  de
	 ld   bc,$05E5
	 exx
	 ld   bc,$0D43
	 ld   l,l
	 ld   bc,$01B6
	 and  h
	 nop
	 adc  a,b
	 ld   bc,$0139
	 sub  e
	 ld   hl,$1F10
	 cpl
	 inc  b
	 and  e
	 ld   hl,$2126
	 ld   b,(hl)
	 ld   hl,$2101
	 add  hl,de
	 ld   hl,$2188
	 ld   h,d
	 ld   hl,$216C
	 pop  hl
	 jr   nz,$3DEF
	 ld   hl,$04A6
	 ld   d,$12
	 xor  d
	 ld   hl,$21D8
	 ld   e,$11
	 sbc  a,$00
	 dec  l
	 ld   de,$20FE
	 ld   a,$02
	 inc  hl
	 ld   ($00C5),hl
	 ld   d,h
	 ld   hl,$12B1
	 adc  a,l
	 ld   hl,$00E6
	 xor  $00
	 jp   pe,$F401
	 ld   bc,$1F01
	 ld   d,b
	 inc  hl
	 ld   h,d
	 ld   (bc),a
	 ex   af,af'
	 rra
	 scf
	 ld   (de),a
	 ld   c,c
	 ld   bc,$1EF8
	 ccf
	 ld   bc,$0EC7
	 or   $24
	 or   a
	 ld   (de),a
	 rla
	 ld   (bc),a
	 jr   $3EB1
	 ld   d,h
	 ld   bc,$04BB
	 jp   $1C11
	 ld   (de),a
	 ld   (de),a
	 ld   (de),a
	 and  b
	 ld   de,$11F1
	 ld   de,$9C0E
	 djnz $3ECB
	 ld   c,$DC
	 rrca
	 jp   z,$B80F
	 rrca
	 and  (hl)
	 rrca
	 sub  e
	 inc  hl
	 ld   e,b
	 ld   de,$0220
	 sub  l
	 ld   de,$0E31
	 add  a,d
	 ld   de,$1229
	 sbc  a,b
	 rrca
	 call $B710
	 djnz $3EA5
	 inc  c
	 rst  $00
	 ld   (de),a
	 or   (hl)
	 ld   de,$24E8
	 xor  e
	 ld   de,$1166
	 inc  iyh
	 ld   de,$4C0D
	 dec  h
	 jp   m,$D022
	 ld   de,$11DB
	 jp   c,$DA24
	 ld   c,$ED
	 ld   c,$18
	 daa
	 ld   a,$26
	 ld   a,(bc)
	 djnz $3F1A
	 jr   z,$3F0F
	 djnz $3F1A
	 jr   z,$3F24
	 jr   z,$3EBC
	 nop
	 ld   c,l
	 ld   c,$EE
	 rrca
	 call m,$550F
	 djnz $3F3B
	 djnz $3F63
	 djnz $3F74
	 djnz $3F65
	 jr   z,$3F56
	 jr   z,$3F7A
	 jr   z,$3F63
	 ld   ($25D0),hl
	 add  a,a
	 ld   ($047E),hl
	 or   (hl)
	 ld   h,$5C
	 daa
	 add  hl,hl
	 ld   (bc),a
	 ld   l,e
	 nop
	 adc  a,b
	 ld   de,$26E6
	 inc  b
	 daa
	 jp   nc,$E226
	 ld   hl,($26EB)
	 add  hl,bc
	 daa
	 rst  $10
	 ld   h,$F0
	 ld   h,$FA
	 ld   h,$DC
	 ld   h,$F5
	 ld   h,$FF
	 ld   h,$E1
	 ld   h,$E6
	 ld   de,$2AF6
	 in   a,($12)
	 inc  a
	 ld   de,$10FE
	 ld   c,d
	 ld   de,$110E
	 sub  c
	 djnz $3F76
	 ld   h,$1D
	 inc  hl
	 add  a,(hl)
	 djnz $3F66
	 ld   h,$26
	 inc  l
	 ex   af,af'
	 dec  h
	 ld   a,l
	 dec  l
	 or   d
	 inc  l
	 add  hl,de
	 dec  l
	 ld   c,(hl)
	 inc  l
	 ret  nz
	 dec  hl
	 cp   e
	 inc  h
	 halt
	 jr   nc,$3F92
	 dec  d
	 sub  c
	 jr   nc,$3FDB
	 jr   nc,$3F13
	 jr   nc,$3F30
	 jr   nc,$3FDE
	 ld   d,$92
	 ld   d,$EC
	 ld   sp,$31CB
	 ld   bc,$FD32
	 nop
	 add  hl,bc
	 ld   (bc),a
	 ld   b,$13
	 or   b
	 ld   ($3358),a
	 inc  d
	 ld   ($3206),a
	 jp   pe,$4032
	 ld   c,$05
	 inc  (hl)
	 ld   b,c
	 ld   sp,$30E7
	 pop  af
	 ld   e,$A9
	 inc  hl
	 sub  c
	 dec  (hl)
	 and  d
	 inc  (hl)
	 jr   nz,$3F91
	 ex   (sp),hl
	 dec  (hl)
	 ld   a,e
	 ld   sp,$3189
	 or   d
	 dec  (hl)
	 ld   ($D132),hl
	 dec  (hl)
	 call z,$9A34
	 dec  (hl)
	 xor  b
	 ld   ($34BE),a
	 inc  c
	 jr   nc,$4016
	 inc  (hl)
	 pop  bc
	 inc  sp
	 ld   l,$33
	 adc  a,d
	 ld   ($327C),a
	 ld   (hl),a
	 inc  sp
	 call nz,$E335
	 ld   hl,$28AA
	 ld   e,(hl)
	 inc  h
	 jp   z,$2022
	 dec  (hl)
	 ld   b,c
	 dec  (hl)
	 sub  l
	 inc  h
	 rlca
	 inc  h
	 and  l
	 inc  (hl)
	 rst  $28
	 dec  (hl)
	 exx
	 dec  sp
	 ld   sp,$6722
	 cpl
	 ld   de,$9213
	 rra
	 jr   nz,$3FF3
	 cp   a
	 ld   bc,$2DE3
	 call m,$D63B
	 ld   l,$52
	 inc  (hl)
	 ld   l,e
	 inc  a
	 sub  h
	 inc  bc
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 rst  $38
	 ld   d,e
	 ld   d,b
	 ld   b,c
	 ld   b,e
	 ld   b,l
	 jr   nz,$4050
	 ld   b,c
	 ld   d,b
	 nop
	 ld   b,h
	 ld   c,(hl)
	 ld   b,c
	 nop
	 ex   af,af'
	 add  hl,de
	 add  a,b
;
	 .END
