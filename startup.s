.proc Startup
	sei
	cld

	ldx #$40
	stx Ctrl2_FrameCtr_4017

	ldx #$ff
	txs

	inx
	txa
	:
		sta $00,x
		sta $100,x
		sta $200,x
		sta $300,x
		sta $400,x
		sta $500,x
		sta $600,x
		sta $700,x
		inx
		bne :-

	sta PpuControl_2000
	sta PpuMask_2001

	ldx #$20
	stx PpuAddr_2006
	ldx #$00
	stx PpuAddr_2006
	txa
	ldy #$10
	:
		sta PpuData_2007
		inx
		bne :-
		dey
		bne :-

	ldx #$3f
	stx PpuAddr_2006
	ldx #$00
	stx PpuAddr_2006
	lda #$0f
	:
		sta PpuData_2007
		inx
		cpx #$20
		bne :-

	MMC5Startup:
		; PRG and CHR modes
		lda #$03
		sta PRGMode_5100

		; Enable PRG-RAM
		lda #$02
		sta PRGRAMProtect_5102
		lsr
		sta PRGRAMProtect_5103

		; Extended attributes
		lda #%01
		sta RAMMode_5104
		lda #0
		tax
		:
			sta $5c00,x
			sta $5d00,x
			sta $5e00,x
			sta $5f00,x
			inx
			bne :-

		; Nametable Mirroring (#%00 = A, #%01 = B, #%10 = MMC5, #%11 = Fill; DDCCBBAA)
		lda #%00000000
		sta NTMapping_5105

		; Reset Banks
		lda #0
		sta CurrentBank6000
		sta Prg6000_5113
		lda #$80
		sta Prg8000_5114
		sta CurrentBank8000
		lda #$80|125
		sta PrgA000_5115
		sta CurrentBankA000
		lda #$80|126
		sta PrgC000_5116
		sta CurrentBankC000

		lda #0
		sta CHRMode_5101
		; These registers are ignored in extended attribute mode
		;ldx #0
		;stx ChrUpperBits_5130
		;stx Chr000_BG_5128
		;inx
		;stx Chr400_BG_5129
		;inx
		;stx Chr800_BG_512a
		;inx
		;stx ChrC00_BG_512b
		;ldx #0
		;stx Chr0000_SPR_5120
		;stx Chr1000_SPR_5124
		;inx
		;stx Chr0400_SPR_5121
		;stx Chr1400_SPR_5125
		;inx
		;stx Chr0800_SPR_5122
		;stx Chr1800_SPR_5126
		;inx
		;stx Chr0C00_SPR_5123
		;stx Chr1C00_SPR_5127

		; Vertical Split Screen
		lda #$00
		sta VerticalSplitMode_5200

		; Disable MMC5 IRQs
		sta ScanlineIRQStatus_5204
		sta IRQScanline_5203

	cli
.endproc
