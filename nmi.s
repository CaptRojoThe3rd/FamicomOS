.segment "BANK_003"

.proc NMI
	pha
	txa
	pha
	tya
	pha

	; Sprite DMA Transfer
	lda #$00
	sta OamAddr_2003
	lda #$02
	sta SpriteDma_4014

	; Set scroll to 0
	lda PpuControl_Copy
	and #$fc
	sta PpuControl_Copy
	sta PpuControl_2000
	lda #0
	sta PpuScroll_2005
	sta PpuScroll_2005

	; Read keyboard inputs
	ldx #8
	:
		lda KeyboardInputs,x
		sta KeyboardInputsOld,x
		dex
		bpl :-
	inx
	lda #$05
	sta Ctrl1_4016
	:
		lda #$04
		sta Ctrl1_4016
		lda Ctrl2_FrameCtr_4017
		lsr
		and #$0f
		eor #$0f
		sta KeyboardInputs,x
		lda #$06
		sta Ctrl1_4016
		lda Ctrl2_FrameCtr_4017
		asl
		asl
		asl
		and #$f0
		eor #$f0
		ora KeyboardInputs,x
		sta KeyboardInputs,x
		inx
		cpx #9
		bne :-
	ldx #8
	:
		lda KeyboardInputsOld,x
		eor #$ff
		and KeyboardInputs,x
		sta KeyboardInputsNew,x
		dex
		bpl :-

	inc NMIDone
	pla
	tay
	pla
	tax
	pla
	rti
.endproc

.proc WaitForNMI
	lda NMIDone
	beq WaitForNMI
	dec NMIDone
	rts
.endproc