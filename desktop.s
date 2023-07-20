.proc Desktop

	.proc SwitchTo
		lda SwitchingApps
		cmp #56
		bne :+
		; PPU Address
		ldx #$00
		stx Temp+10
		lda #$20
		sta Temp+11
		; Attribute Address
		stx Temp+12
		lda #$5c
		sta Temp+13
		; Tile Value
		stx Temp+14
		; Attribute Value
		lda #$c4
		sta Temp+15
		stx Prg6000_5113
		lda SystemSettings_Appearance
		and #$70
		lsr
		lsr
		clc
		adc Temp+15
		sta Temp+15
		:

		lda SwitchingApps
		cmp #28
		bne :++++
		lda SystemSettings_Appearance
		and #$70
		cmp #$70
		beq :++
		lsr
		lsr
		tax
		stx Temp+9
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
		sta Palette+13
		:
		lda Palette+12
		sta Palette+16
		:

		lda Temp+15
		sec
		sbc #$c4
		cmp #7
		beq @0
		ldy #0
		ldx #0
		:
			lda Temp+10
			sta PPUSingleTileAddrLo,x
			lda Temp+11
			sta PPUSingleTileAddrHi,x
			lda #1
			sta PPUSingleTileData,x
			lda SystemSettings_Appearance
			and #$70
			cmp #$70
			beq :+
			lda Temp+14
			sta PPUSingleTileData,x
			:

			lda #$c0
			sta (Temp+12),y
			lda SystemSettings_Appearance
			and #$70
			cmp #$70
			beq :+
			lda Temp+15
			sta (Temp+12),y
			:

			inc Temp+14

			inc Temp+10
			bne :+
			inc Temp+11
			inc Temp+15
			:

			inc Temp+12
			bne :+
			inc Temp+13
			:

			inx
			cpx #16
			bne :-----

		stx PPUSingleTileIndex


		@0:

		rts
	.endproc

	.proc Update
		rts
	.endproc

.endproc
