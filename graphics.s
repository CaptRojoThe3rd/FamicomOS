.segment "BANK_003"

.proc ClearSpriteDataWithIndex
	lda SpriteIndex
	beq :++
	sta Temp
	ldx #0
	stx SpriteIndex
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
	rts
.endproc

.proc AddBufferToSpriteData
	ldx SpriteIndex
	lda SpriteBuffer
	sta SpriteData,x
	inx
	lda SpriteBuffer+1
	sta SpriteData,x
	inx
	lda SpriteBuffer+2
	sta SpriteData,x
	inx
	lda SpriteBuffer+3
	sta SpriteData,x
	inx
	stx SpriteIndex
	rts
.endproc