.segment "BANK_003"

.proc IRQ
	pha
	txa
	pha
	tya
	pha

	lda ScanlineIRQStatus_5204

	ldx #$1b
	ldy #$00
	lda #$3f

	jsr Wait50Cycles
	
	sty PpuMask_2001
	sta PpuAddr_2006
	sty PpuAddr_2006
	stx PpuData_2007
	sta PpuAddr_2006
	ldy #13
	sty PpuAddr_2006

	jsr Wait50Cycles
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

	lda #$2f
	sta PpuAddr_2006
	lda #$60
	sta PpuAddr_2006

	lda PpuMask_Copy
	sta PpuMask_2001

	bit DisableInput
	bpl :+
	; Show data recorder animation
	lda TilesUpdated
	and #1
	bne :++
	ldx #$2f
	stx PPUSingleTileAddrHi
	stx PPUSingleTileAddrHi+1
	stx PPUSingleTileAddrHi+2
	stx PPUSingleTileAddrHi+3
	ldx #$96
	stx PPUSingleTileAddrLo
	inx
	stx PPUSingleTileAddrLo+1
	ldx #$b6
	stx PPUSingleTileAddrLo+2
	inx
	stx PPUSingleTileAddrLo+3
	ldx #$29
	stx PPUSingleTileData
	inx
	stx PPUSingleTileData+1
	inx
	stx PPUSingleTileData+2
	inx
	stx PPUSingleTileData+3
	ldx #4
	stx PPUSingleTileIndex
	lda #1
	sta TilesUpdated
	bne :++
	:
	; Hide data recorder animation
	lda TilesUpdated
	and #2
	bne :+
	ldx #$2f
	stx PPUSingleTileAddrHi
	stx PPUSingleTileAddrHi+1
	stx PPUSingleTileAddrHi+2
	stx PPUSingleTileAddrHi+3
	ldx #$96
	stx PPUSingleTileAddrLo
	inx
	stx PPUSingleTileAddrLo+1
	ldx #$b6
	stx PPUSingleTileAddrLo+2
	inx
	stx PPUSingleTileAddrLo+3
	ldx #$00
	stx PPUSingleTileData
	stx PPUSingleTileData+1
	stx PPUSingleTileData+2
	stx PPUSingleTileData+3
	ldx #4
	stx PPUSingleTileIndex
	lda #2
	sta TilesUpdated
	:
	bit DisableInput
	bpl :+
	jsr ClearSpriteDataWithIndex
	lda #234
	sta SpriteBuffer
	lda #$ed
	sta SpriteBuffer+1
	lda #0
	sta SpriteBuffer+2
	lda #186
	sta SpriteBuffer+3
	jsr AddBufferToSpriteData
	lda #222
	sta SpriteBuffer
	lda DataRecorderAnimationFrame
	asl
	adc #$ef
	sta SpriteBuffer+1
	lda #$20
	sta SpriteBuffer+2
	lda #184
	sta SpriteBuffer+3
	jsr AddBufferToSpriteData
	lda SixtyFrameCounter
	bne :+
	jsr :+++++
	:
	cmp #15
	bne :+
	jsr :++++
	:
	cmp #30
	bne :+
	jsr :+++
	:
	cmp #45
	bne :+
	jsr :++
	:

	pla
	tay
	pla
	tax
	pla	
	rti
	:
		bit DisableInput
		bvc :+
		ldx DataRecorderAnimationFrame
		inx
		stx DataRecorderAnimationFrame
		cpx #4
		bne :++
		ldx #0
		stx DataRecorderAnimationFrame
		beq :++
		:
		ldx DataRecorderAnimationFrame
		dex
		stx DataRecorderAnimationFrame
		bpl :+
		ldx #3
		stx DataRecorderAnimationFrame
		:
		rts
.endproc
