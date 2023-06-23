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
	
	sty PpuMask_2001
	sta PpuAddr_2006
	sty PpuAddr_2006
	stx PpuData_2007

	lda #$23
	sta PpuAddr_2006
	lda #$60
	sta PpuAddr_2006

	lda PpuMask_Copy
	sta PpuMask_2001

	pla
	tay
	pla
	tax
	pla
	rti
.endproc
