.include "header.s"

.include "chr/chr.s"

.include "labels.s"
.include "macros.s"

.include "irq.s"
.include "nmi.s"

.segment "BANK_003"
.include "startup.s"

.proc SysReset
	
.endproc

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