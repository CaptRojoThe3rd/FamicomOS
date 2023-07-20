.segment "BANK_003"

.proc Wait50Cycles
	; Technically the NOP instructions only wait 38 cycles, the other 12 come from the JSR and RTS instructions.
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	rts
.endproc

.proc NMI
	pha
	txa
	pha
	tya
	pha

	; IRQ
	lda #216
	sta IRQScanline_5203
	lda #$80
	sta ScanlineIRQStatus_5204

	; Palette
	ldx #$3f
	stx PpuAddr_2006
	ldx #$00
	stx PpuAddr_2006
	:
		lda Palette,x
		sta PpuData_2007
		inx
		cpx #32
		bne :-

	; Single-tile updates
	lda PPUSingleTileIndex
	beq :++
	ldx #0
	:
		lda PPUSingleTileAddrHi,x
		sta PpuAddr_2006
		lda PPUSingleTileAddrLo,x
		sta PpuAddr_2006
		lda PPUSingleTileData,x
		sta PpuData_2007
		lda #0
		inx
		cpx PPUSingleTileIndex
		bne :-
	ldx #0
	stx PPUSingleTileIndex
	:

	; Set scroll to 0x 0y at $2c00
	lda PpuControl_Copy
	ora #$03
	sta PpuControl_Copy
	sta PpuControl_2000
	lda #0
	sta PpuScroll_2005
	sta PpuScroll_2005

	; Sprite DMA Transfer
	lda #$00
	sta OamAddr_2003
	lda #$02
	sta SpriteDma_4014

	; Read keyboard and controller inputs
	lda DisableInput
	beq :+
	jmp :+++++++
	:
	lda #0
	sta KeysPressed
	ldx #8
	:
		lda KeyboardInputs,x
		sta KeyboardInputsOld,x
		dex
		bpl :-
	lda Controller1Inputs
	sta Controller1InputsOld
	lda Controller2Inputs
	sta Controller2InputsOld
	inx
	lda #$05
	sta Ctrl1_4016
	jsr Wait50Cycles
	:
		lda #$04
		sta Ctrl1_4016
		jsr Wait50Cycles
		lda Ctrl2_FrameCtr_4017
		lsr
		and #$0f
		eor #$0f
		sta KeyboardInputs,x
		lda #$06
		sta Ctrl1_4016
		jsr Wait50Cycles
		lda Ctrl2_FrameCtr_4017
		asl
		asl
		asl
		and #$f0
		eor #$f0
		ora KeyboardInputs,x
		sta KeyboardInputs,x
		beq :+
		inc KeysPressed
		:
		inx
		cpx #9
		bne :--
	ldx #1
	stx Ctrl1_4016
	dex
	stx Ctrl1_4016
	ldx #8
	:
		lda Ctrl1_4016
		lsr
		rol Controller1Inputs
		lda Ctrl2_FrameCtr_4017
		lsr
		rol Controller2Inputs
		dex
		bne :-
	ldx #8
	:
		lda KeyboardInputsOld,x
		eor #$ff
		and KeyboardInputs,x
		sta KeyboardInputsNew,x
		dex
		bpl :-
	lda Controller1InputsOld
	eor #$ff
	and Controller1Inputs
	sta Controller1InputsNew
	lda Controller2InputsOld
	eor #$ff
	and Controller2Inputs
	sta Controller2InputsNew
	ldx #4
	stx Ctrl1_4016
	:

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