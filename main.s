.include "header.s"

.include "chr/chr.s"

.include "labels.s"
.include "macros.s"

.include "graphics.s"
.include "irq.s"
.include "nmi.s"

.include "filesystem.s"

.include "desktop.s"

.segment "BANK_003"

DefaultPalette:
	.byte $1b, $2d, $10, $30
	.byte $1b, $06, $10, $00
	.byte $1b, $11, $37, $00
	.byte $1b, $00, $00, $00

	.byte $1b, $26, $30, $10
	.byte $1b, $06, $10, $2d
	.byte $1b, $00, $10, $30
	.byte $1b, $00, $00, $00

MouseCursorPalettes:
	.byte $1b, $2d, $10, $30
	.byte $1b, $16, $18, $27
	.byte $1b, $18, $36, $2a
	.byte $1b, $27, $02, $10
	.byte $1b, $2d, $10, $30
	.byte $1b, $00, $00, $00
	.byte $1b, $00, $00, $00
	.byte $1b, $00, $00, $00
	.byte $1b, $00, $00, $00
	.byte $1b, $30, $00, $0f
	.byte $1b, $35, $25, $0f
	.byte $1b, $16, $06, $27
	.byte $1b, $11, $06, $2c
	.byte $1b, $00, $0f, $30
	.byte $1b, $11, $06, $2c
	.byte $1b, $00, $0f, $30

DesktopBackgroundPalettes:
	.byte $29, $19, $2c, $30
	.byte $17, $08, $2c, $21
	.byte $30, $0f, $26, $00
	.byte $11, $0f, $30, $1a
	.byte $30, $00, $0f, $10
	.byte $09, $00, $19, $10
	

KeyboardInfoSprites:
	.byte 227, $fd, 0, 244 ; Stop
	.byte 227, $fd, 0, 242 ; Yen
	.byte 233, $fb, 0, 243 ; RShift
	.byte 231, $fd, 0, 244 ; Kana
	.byte 231, $fd, 0, 242 ; Close Bracket
	.byte 229, $fd, 0, 241 ; Open Bracket
	.byte 229, $fb, 0, 243 ; Return
	.byte 225, $fb, 0, 245 ; F8
	.byte 227, $fd, 0, 240 ; Carat
	.byte 227, $fd, 0, 238 ; Hypen
	.byte 233, $fd, 0, 239 ; Slash
	.byte 233, $fd, 0, 241 ; Underscore
	.byte 231, $fd, 0, 238 ; Semicolon
	.byte 231, $fd, 0, 240 ; Colon
	.byte 229, $fd, 0, 239 ; At
	.byte 225, $fb, 0, 241 ; F7
	.byte 227, $fd, 0, 236 ; Zero
	.byte 229, $fd, 0, 237 ; P
	.byte 233, $fd, 0, 235 ; Comma
	.byte 233, $fd, 0, 237 ; Period
	.byte 231, $fd, 0, 234 ; K
	.byte 231, $fd, 0, 236 ; L
	.byte 229, $fd, 0, 235 ; O
	.byte 225, $fb, 0, 237 ; F6
	.byte 227, $fd, 0, 232 ; Eight
	.byte 227, $fd, 0, 234 ; Nine
	.byte 233, $fd, 0, 231 ; N
	.byte 233, $fd, 0, 233 ; M
	.byte 231, $fd, 0, 232 ; J
	.byte 229, $fd, 0, 231 ; U
	.byte 229, $fd, 0, 233 ; I
	.byte 225, $fb, 0, 233 ; F5
	.byte 227, $fd, 0, 228 ; Six
	.byte 227, $fd, 0, 230 ; Seven
	.byte 233, $fd, 0, 227 ; V
	.byte 233, $fd, 0, 229 ; B
	.byte 231, $fd, 0, 230 ; H
	.byte 231, $fd, 0, 228 ; G
	.byte 229, $fd, 0, 229 ; Y
	.byte 225, $fb, 0, 229 ; F4
	.byte 227, $fd, 0, 224 ; Four
	.byte 227, $fd, 0, 226 ; Five
	.byte 233, $fd, 0, 225 ; C
	.byte 231, $fd, 0, 226 ; F
	.byte 231, $fd, 0, 224 ; D
	.byte 229, $fd, 0, 225 ; R
	.byte 229, $fd, 0, 227 ; T
	.byte 225, $fb, 0, 225 ; F3
	.byte 227, $fd, 0, 222 ; Three
	.byte 229, $fd, 0, 223 ; E
	.byte 233, $fd, 0, 221 ; Z
	.byte 233, $fd, 0, 223 ; X
	.byte 231, $fd, 0, 220 ; A
	.byte 231, $fd, 0, 222 ; S
	.byte 229, $fd, 0, 221 ; W
	.byte 225, $fb, 0, 221 ; F2
	.byte 227, $fd, 0, 220 ; Two
	.byte 227, $fd, 0, 218 ; One
	.byte 235, $fd, 0, 223 ; GRPH
	.byte 233, $fb, 0, 217 ; LShift
	.byte 231, $fd, 0, 218 ; Control
	.byte 229, $fd, 0, 219 ; Q
	.byte 229, $fd, 0, 217 ; Escape
	.byte 225, $fb, 0, 217 ; F1
	.byte 228, $fd, 0, 250 ; Insert
	.byte 228, $fd, 0, 252 ; Delete
	.byte 235, $ff, 0, 225 ; Space (First Half)
	.byte 234, $fb, 0, 249 ; Down
	.byte 232, $fb, 0, 247 ; Left
	.byte 232, $fb, 0, 251 ; Right
	.byte 230, $fb, 0, 249 ; Up
	.byte 228, $fd, 0, 248 ; Clear/Home

ControllerInfoSprites:
	.byte 226, $f7, 0, 213 ; A
	.byte 226, $f7, 0, 210 ; B
	.byte 226, $f9, 0, 201 ; Select
	.byte 226, $f9, 0, 205 ; Start
	.byte 224, $f7, 0, 195 ; Up
	.byte 228, $f7, 0, 195 ; Down
	.byte 226, $f7, 0, 193 ; Left
	.byte 226, $f7, 0, 197 ; Right

.proc SysReset
	ldx #0
	stx CurrentBank6000
	stx Prg6000_5113
	txa
	:
		sta $6000,x
		sta $6100,x
		sta $6200,x
		sta $6300,x
		sta $6400,x
		sta $6500,x
		sta $6600,x
		sta $6700,x
		sta $6800,x
		sta $6900,x
		sta $6a00,x
		sta $6b00,x
		sta $6c00,x
		sta $6d00,x
		sta $6e00,x
		sta $6f00,x
		sta $7000,x
		sta $7100,x
		sta $7200,x
		sta $7300,x
		sta $7400,x
		sta $7500,x
		sta $7600,x
		sta $7700,x
		sta $7800,x
		sta $7900,x
		sta $7a00,x
		sta $7b00,x
		sta $7c00,x
		sta $7d00,x
		sta $7e00,x
		sta $7f00,x
		inx
		bne :-
.endproc

.proc DynamicJump
	tax

	pla
	sta Temp
	pla
	sta Temp+1

	inc Temp
	ldy #0
	lda (Temp),y
	asl
	adc Temp
	sta Temp+4
	lda Temp+1
	adc #0
	pha
	lda Temp+4
	pha

	txa
	asl
	inc Temp

	tay

	lda (Temp),y
	sta Temp+2
	iny
	lda (Temp),y
	sta Temp+3

	jmp (Temp+2)
.endproc

.include "startup.s"

.proc Main
	; Clear sprite data
	lda #$ff
	ldx #0
	:
		sta SpriteData,x
		inx
		inx
		inx
		inx
		bne :-

	; Draw screen
	lda #$20
	sta PpuAddr_2006
	ldx #0
	stx PpuAddr_2006
	ldy #4
	lda #1
	:
		sta PpuData_2007
		inx
		bne :-
		dey
		bne :-
	lda #%10
	sta RAMMode_5104

	; Desktop background
	lda #$2c
	sta PpuAddr_2006
	ldy #$00
	sty PpuAddr_2006
	lda #$5c
	sta Temp+1
	sty Temp
	sty Temp+2
	sty Prg6000_5113
	lda SystemSettings_Appearance
	and #$70
	cmp #$70
	beq @DesktopSolidColor
	lsr
	lsr
	sta Temp
	sta Temp+3
	ldx #0
	:
		txa
		sta PpuData_2007
		inx
		cpx #$80
		beq :+
		cpx #$00
		bne :-
		inc Temp+2
		bne :-
		:
		ldy Temp+2
		cpy #$03
		bne :--
	ldx #0
	clc
	:
		lda #$c4
		adc Temp
		sta $5c00,x
		lda #$c5
		adc Temp
		sta $5d00,x
		lda #$c7
		adc Temp
		sta $5e80,x
		lda #$c6
		adc Temp
		sta $5e00,x
		inx
		bne :-
	beq :+++
	@DesktopSolidColor:
	lda #$01
	ldy #$03
	:
		sta PpuData_2007
		inx
		cpx #$80
		beq :+
		cpx #$00
		bne :-
		inc Temp+2
		bne :-
		:
		ldy Temp+2
		cpy #$03
		bne :--
	:
	lda #56
	sta SwitchingApps

	; Taskbar
	lda #$23
	sta PpuAddr_2006
	lda #$80
	sta PpuAddr_2006
	ldx #64
	lda #0
	:
		sta PpuData_2007
		dex
		bne :-
	; Start menu
	lda #$2f
	sta PpuAddr_2006
	lda #$80
	sta PpuAddr_2006
	lda SystemSettings_Appearance
	and #$80
	lsr
	lsr
	lsr
	lsr
	lsr
	sta Temp
	lda #$04
	clc
	adc Temp
	sta PpuData_2007
	adc #1
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$a0
	sta PpuAddr_2006
	lda #$06
	clc
	adc Temp
	sta PpuData_2007
	adc #1
	sta PpuData_2007
	lda #$40
	sta $5f80
	sta $5f81
	sta $5fa0
	sta $5fa1
	; Settings
	lda #$2f
	sta PpuAddr_2006
	lda #$82
	sta PpuAddr_2006
	lda #$0c
	sta PpuData_2007
	lda #$0d
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$a2
	sta PpuAddr_2006
	lda #$0e
	sta PpuData_2007
	lda #$0f
	sta PpuData_2007
	lda #$40
	sta $5f82
	sta $5f83
	sta $5fa2
	sta $5fa3
	; File Explorer
	lda #$2f
	sta PpuAddr_2006
	lda #$84
	sta PpuAddr_2006
	lda #$10
	sta PpuData_2007
	lda #$11
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$a4
	sta PpuAddr_2006
	lda #$12
	sta PpuData_2007
	lda #$13
	sta PpuData_2007
	lda #$80
	sta $5f84
	sta $5f85
	sta $5fa4
	sta $5fa5
	; Terminal
	lda #$2f
	sta PpuAddr_2006
	lda #$86
	sta PpuAddr_2006
	lda #$14
	sta PpuData_2007
	lda #$15
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$a6
	sta PpuAddr_2006
	lda #$16
	sta PpuData_2007
	lda #$17
	sta PpuData_2007
	; Text Editor
	lda #$2f
	sta PpuAddr_2006
	lda #$88
	sta PpuAddr_2006
	lda #$18
	sta PpuData_2007
	lda #$19
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$a8
	sta PpuAddr_2006
	lda #$1a
	sta PpuData_2007
	lda #$1b
	sta PpuData_2007
	; Keyboard
	lda #$2f
	sta PpuAddr_2006
	lda #$9b
	sta PpuAddr_2006
	lda #$1c
	sta PpuData_2007
	lda #$1d
	sta PpuData_2007
	lda #$1e
	sta PpuData_2007
	lda #$1f
	sta PpuData_2007
	lda #$20
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$bb
	sta PpuAddr_2006
	lda #$21
	sta PpuData_2007
	lda #$22
	sta PpuData_2007
	lda #$23
	sta PpuData_2007
	lda #$24
	sta PpuData_2007
	lda #$25
	sta PpuData_2007
	lda #$40
	sta $5f9b
	sta $5f9c
	sta $5f9d
	sta $5f9e
	sta $5f9f
	sta $5fbb
	sta $5fbc
	sta $5fbd
	sta $5fbe
	sta $5fbf
	; Controllers
	lda #$2f
	sta PpuAddr_2006
	lda #$98
	sta PpuAddr_2006
	lda #$26
	sta PpuData_2007
	lda #$27
	sta PpuData_2007
	lda #$28
	sta PpuData_2007
	lda #$2f
	sta PpuAddr_2006
	lda #$b8
	sta PpuAddr_2006
	lda #$26
	sta PpuData_2007
	lda #$27
	sta PpuData_2007
	lda #$28
	sta PpuData_2007
	; Data Recorder Animation
	lda #$40
	sta $5f96
	sta $5f97
	sta $5fb6
	sta $5fb7
	; Re-enable extended attributes
	lda #%01
	sta RAMMode_5104

	; Palette
	ldx #0
	:
		lda DefaultPalette,x
		sta Palette,x
		inx
		cpx #32
		bne :-
	
	lda SystemSettings_Appearance
	bpl :+
	lda #$0f
	sta Palette+5
	:
	lda SystemSettings_Appearance
	and #$70
	cmp #$70
	beq :++
	ldx Temp+3
	ldy #0
	:
		lda DesktopBackgroundPalettes,x
		sta Palette+12,y
		inx
		iny
		cpy #4
		bne :-
	beq :++
	:
	lda SystemSettings_WallpaperColor
	sta Palette+12
	:

	lda Palette+12
	sta Palette+16

	PPUOn

	MainLoop:
		; Clear used sprite data
		jsr ClearSpriteDataWithIndex

		; Frame counter
		ldx SixtyFrameCounter
		inx
		stx SixtyFrameCounter
		cpx #60
		bne :+
		ldx #0
		stx SixtyFrameCounter
		lda #1
		ora AllowSystemResetFlag
		sta AllowSystemResetFlag
		:

		; System reset
		lda AllowSystemResetFlag
		bne :+
		lda KeyboardInputs
		and KeyBits_Stop
		beq :+
		jmp SysReset
		:

		; Console reset
		lda AllowSystemResetFlag
		beq :+
		lda KeyboardInputs+7
		and KeyBits_Control
		beq :+
		lda KeyboardInputsNew+5
		and KeyBits_R
		beq :+
		jmp ($fffc)
		:

		; Mouse Cursor
		lda Controller1Inputs
		and #$0f
		beq :++++
		tax
		lda #1
		ora MouseCursorMode
		sta MouseCursorMode
		txa
		and DPad_Left
		beq :+
		dec MouseCursorX
		:
		txa
		and DPad_Up
		beq :+
		dec MouseCursorY
		:
		txa
		and DPad_Right
		beq :+
		inc MouseCursorX
		:
		txa
		and DPad_Down
		beq :+
		inc MouseCursorY
		:
		lda MouseCursorX
		cmp #0
		bne :+
		lda #1
		sta MouseCursorX
		:
		cmp #255
		bne :+
		lda #254
		sta MouseCursorX
		:
		lda MouseCursorY
		cmp #239
		bne :+
		lda #238
		sta MouseCursorY
		:
		cmp #255
		bne :+
		lda #0
		sta MouseCursorY
		:
		lda MouseCursorMode
		and #1
		beq :++
		lda MouseCursorY
		sta SpriteBuffer
		lda #$00
		sta Prg6000_5113
		lda SystemSettings_Appearance
		and #$0f
		asl
		adc #$01
		sta SpriteBuffer+1
		lda #$02
		sta SpriteBuffer+2
		lda MouseCursorX
		sta SpriteBuffer+3
		jsr AddBufferToSpriteData
		lda SystemSettings_Appearance
		and #$0f
		asl
		asl
		tax
		ldy #0
		:
			lda MouseCursorPalettes,x
			sta Palette+24,y
			inx
			iny
			cpy #4
			bne :-
		:

		; Keyboard info
		lda KeysPressed
		beq :+++++
		lda #<KeyboardInfoSprites
		sta Temp
		lda #>KeyboardInfoSprites
		sta Temp+1
		lda #$80
		sta Temp+2
		asl
		sta Temp+3
		sta Temp+4
		@0:
			ldx Temp+4
			lda KeyboardInputs,x
			and Temp+2
			beq :+
			ldy #0
			lda (Temp),y
			sta SpriteBuffer
			iny
			lda (Temp),y
			sta SpriteBuffer+1
			iny
			lda (Temp),y
			sta SpriteBuffer+2
			iny
			lda (Temp),y
			sta SpriteBuffer+3
			jsr AddBufferToSpriteData
			:
			lsr Temp+2
			bne :+
			ror Temp+2
			inc Temp+4
			:
			lda #4
			clc
			adc Temp
			sta Temp
			bcc :+
			inc Temp+1
			:
			ldx Temp+3
			inx
			cpx #72
			beq :+
			stx Temp+3
			bne @0
		:
		lda KeyboardInputs+8
		and KeyBits_Space
		beq :+
		lda #235
		sta SpriteBuffer
		lda #$ff
		sta SpriteBuffer+1
		lda #0
		sta SpriteBuffer+2
		lda #232
		sta SpriteBuffer+3
		jsr AddBufferToSpriteData
		:

		; Controller info
		lda #$80
		sta Temp
		ldx #0
		stx Temp+1
		ldy #0
		sty Temp+2
		@1:
			lda Controller1Inputs,y
			and Temp
			beq :+
			ldx Temp+1
			lda ControllerInfoSprites,x
			clc
			adc Temp+2
			sta SpriteBuffer
			inx
			lda ControllerInfoSprites,x
			sta SpriteBuffer+1
			inx
			lda ControllerInfoSprites,x
			sta SpriteBuffer+2
			inx
			lda ControllerInfoSprites,x
			sta SpriteBuffer+3
			jsr AddBufferToSpriteData
			:
			lsr Temp
			bcc :+
			ror Temp
			lda #8
			sta Temp+2
			ldx #0
			stx Temp+1
			iny
			iny
			iny
			cpy #6
			beq :++
			bne @1
			:
			lda Temp+1
			clc
			adc #4
			sta Temp+1
			bne @1
		:

		; Switch apps if an icon is clicked
		lda SwitchingApps
		bne @DontSwitchApps
		lda Controller1InputsNew
		and Button_A
		beq @DontSwitchApps
		lda MouseCursorY
		cmp #223
		bcc @DontSwitchApps
		lda MouseCursorX
		lsr
		lsr
		lsr
		lsr
		cmp #5
		bcs @DontSwitchApps
		sta SelectedApp
		lda #56
		sta SwitchingApps
		@DontSwitchApps:

		; Update apps
		lda SwitchingApps
		beq :+
		lda SelectedApp
		jsr DynamicJump
			.byte 1
			.word Desktop::SwitchTo
		dec SwitchingApps
		bpl :++
		:
		lda SelectedApp
		jsr DynamicJump
			.byte 1
			.word Desktop::Update
		:

		bit PpuStatus_2002

		jsr WaitForNMI
		jmp MainLoop
.endproc


.segment "VECTORS"
	.word NMI
	.word Startup
	.word IRQ