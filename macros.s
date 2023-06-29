.macro PPUOn
	lda #%00011110
	sta PpuMask_2001
	sta PpuMask_Copy
	lda #%10100000
	sta PpuControl_2000
	sta PpuControl_Copy
.endmacro

.macro PPUOff
	lda #%00000000
	sta PpuControl_2000
	sta PpuControl_Copy
	lda #%00100000
	sta PpuMask_Copy
	sta PpuMask_2001
.endmacro

.macro HorizontalMirroring
	lda #$50
	sta $5105
.endmacro

.macro VerticalMirroring
	lda #$44
	sta $5105
.endmacro

.macro PauseUntilvBlank
	:
	bit PpuStatus_2002
	bpl :-
.endmacro

.macro indjsr JumpAddressLocation, ReturnAddress
	lda #>ReturnAddress
	pha
	lda #<ReturnAddress-1
	pha
	jmp (JumpAddressLocation)
.endmacro

.macro DebugStp
	sei
	PPUOff
	:
	jmp :-
.endmacro

.macro DebugEvents
	bit PpuStatus_2002
	bit PpuStatus_2002
	bit PpuStatus_2002
	bit PpuStatus_2002
	bit PpuStatus_2002
.endmacro

.macro DebugEvent
	bit PpuStatus_2002
.endmacro

.macro stp
	.byte $22
.endmacro