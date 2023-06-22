.segment "BANK_003"

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