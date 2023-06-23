.include "header.s"

.include "chr/chr.s"

.include "labels.s"
.include "macros.s"

.include "irq.s"
.include "nmi.s"

.segment "BANK_003"

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

	PPUOn

	MainLoop:
		; Clear used sprite data
		lda SpriteIndex
		beq :++
		sta Temp
		ldx #0
		lda #$ff
		:
			sta SpriteData,x
			inx
			inx
			inx
			inx
			cpx Temp
			bne :-
		:

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


		jsr WaitForNMI
		jmp MainLoop
.endproc


.segment "VECTORS"
	.word NMI
	.word Startup
	.word IRQ