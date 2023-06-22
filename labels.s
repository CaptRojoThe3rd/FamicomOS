.define KeyBits_Stop			#$80
.define KeyBits_Yen				#$40
.define KeyBits_RShift			#$20
.define KeyBits_Kana			#$10
.define KeyBits_CloseBracket	#$8
.define KeyBits_OpenBracket		#$4
.define KeyBits_Return			#$2
.define KeyBits_F8				#$1
.define KeyBits_Carat			#$80
.define KeyBits_Hypen			#$40
.define KeyBits_Slash			#$20
.define KeyBits_Underscore		#$10
.define KeyBits_Semicolon		#$8
.define KeyBits_Colon			#$4
.define KeyBits_At				#$2
.define KeyBits_F7				#$1
.define KeyBits_Zero			#$80
.define KeyBits_P				#$40
.define KeyBits_Comma			#$20
.define KeyBits_Period			#$10
.define KeyBits_K				#$8
.define KeyBits_L				#$4
.define KeyBits_O				#$2
.define KeyBits_F6				#$1
.define KeyBits_Eight			#$80
.define KeyBits_Nine			#$40
.define KeyBits_N				#$20
.define KeyBits_M				#$10
.define KeyBits_J				#$8
.define KeyBits_U				#$4
.define KeyBits_I				#$2
.define KeyBits_F5				#$1
.define KeyBits_Six				#$80
.define KeyBits_Seven			#$40
.define KeyBits_V				#$20
.define KeyBits_B				#$10
.define KeyBits_H				#$8
.define KeyBits_G				#$4
.define KeyBits_Y				#$2
.define KeyBits_F4				#$1
.define KeyBits_Four			#$80
.define KeyBits_Five			#$40
.define KeyBits_C				#$20
.define KeyBits_F				#$10
.define KeyBits_D				#$8
.define KeyBits_R				#$4
.define KeyBits_T				#$2
.define KeyBits_F3				#$1
.define KeyBits_Three			#$80
.define KeyBits_E				#$40
.define KeyBits_Z				#$20
.define KeyBits_X				#$10
.define KeyBits_A				#$8
.define KeyBits_S				#$4
.define KeyBits_W				#$2
.define KeyBits_F2				#$1
.define KeyBits_Two				#$80
.define KeyBits_One				#$40
.define KeyBits_GRPH			#$20
.define KeyBits_LShift			#$10
.define KeyBits_Control			#$8
.define KeyBits_Q				#$4
.define KeyBits_Escape			#$2
.define KeyBits_F1				#$1
.define KeyBits_Insert			#$80
.define KeyBits_Delete			#$40
.define KeyBits_Space			#$20
.define KeyBits_Down			#$10
.define KeyBits_Left			#$8
.define KeyBits_Right			#$4
.define KeyBits_Up				#$2
.define KeyBits_ClearHome		#$1

.define KeyIndex_Stop			#$0
.define KeyIndex_Yen			#$0
.define KeyIndex_RShift			#$0
.define KeyIndex_Kana			#$0
.define KeyIndex_CloseBracket	#$0
.define KeyIndex_OpenBracket	#$0
.define KeyIndex_Return			#$0
.define KeyIndex_F8				#$0
.define KeyIndex_Carat			#$1
.define KeyIndex_Hypen			#$1
.define KeyIndex_Slash			#$1
.define KeyIndex_Underscore		#$1
.define KeyIndex_Semicolon		#$1
.define KeyIndex_Colon			#$1
.define KeyIndex_At				#$1
.define KeyIndex_F7				#$1
.define KeyIndex_Zero			#$2
.define KeyIndex_P				#$2
.define KeyIndex_Comma			#$2
.define KeyIndex_Period			#$2
.define KeyIndex_K				#$2
.define KeyIndex_L				#$2
.define KeyIndex_O				#$2
.define KeyIndex_F6				#$2
.define KeyIndex_Eight			#$3
.define KeyIndex_Nine			#$3
.define KeyIndex_N				#$3
.define KeyIndex_M				#$3
.define KeyIndex_J				#$3
.define KeyIndex_U				#$3
.define KeyIndex_I				#$3
.define KeyIndex_F5				#$3
.define KeyIndex_Six			#$4
.define KeyIndex_Seven			#$4
.define KeyIndex_V				#$4
.define KeyIndex_B				#$4
.define KeyIndex_H				#$4
.define KeyIndex_G				#$4
.define KeyIndex_Y				#$4
.define KeyIndex_F4				#$4
.define KeyIndex_Four			#$5
.define KeyIndex_Five			#$5
.define KeyIndex_C				#$5
.define KeyIndex_F				#$5
.define KeyIndex_D				#$5
.define KeyIndex_R				#$5
.define KeyIndex_T				#$5
.define KeyIndex_F3				#$5
.define KeyIndex_Three			#$6
.define KeyIndex_E				#$6
.define KeyIndex_Z				#$6
.define KeyIndex_X				#$6
.define KeyIndex_A				#$6
.define KeyIndex_S				#$6
.define KeyIndex_W				#$6
.define KeyIndex_F2				#$6
.define KeyIndex_Two			#$7
.define KeyIndex_One			#$7
.define KeyIndex_GRPH			#$7
.define KeyIndex_LShift			#$7
.define KeyIndex_Control		#$7
.define KeyIndex_Q				#$7
.define KeyIndex_Escape			#$7
.define KeyIndex_F1				#$7
.define KeyIndex_Insert			#$8
.define KeyIndex_Delete			#$8
.define KeyIndex_Space			#$8
.define KeyIndex_Down			#$8
.define KeyIndex_Left			#$8
.define KeyIndex_Right			#$8
.define KeyIndex_Up				#$8
.define KeyIndex_ClearHome		#$8	


PpuControl_2000					= $2000
PpuMask_2001					= $2001
PpuStatus_2002					= $2002
OamAddr_2003					= $2003
OamData_2004					= $2004
PpuScroll_2005					= $2005
PpuAddr_2006					= $2006
PpuData_2007					= $2007
SpriteDma_4014					= $4014

Sq0Duty_4000					= $4000
Sq0Sweep_4001					= $4001
Sq0Timer_4002					= $4002
Sq0Length_4003					= $4003

Sq1Duty_4004					= $4004
Sq1Sweep_4005					= $4005
Sq1Timer_4006					= $4006
Sq1Length_4007					= $4007

TrgLinear_4008					= $4008
TrgTimer_400A					= $400a
TrgLength_400B					= $400b

NoiseVolume_400C				= $400c
NoisePeriod_400E				= $400e
NoiseLength_400F				= $400f

DmcFreq_4010					= $4010
DmcCounter_4011 				= $4011
DmcAddress_4012					= $4012
DmcLength_4013					= $4013

ApuStatus_4015					= $4015

Ctrl1_4016						= $4016
Ctrl2_FrameCtr_4017				= $4017

MMC5_Sq0Duty_5000           	= $5000
MMC5_Sq0Timer_5002          	= $5002
MMC5_Sq0Length_5003				= $5003

MMC5_Sq1Duty_5004           	= $5004
MMC5_Sq1Timer_5006          	= $5006
MMC5_Sq1Length_5007         	= $5007

MMC5_PCMData_5011				= $5011
MMC5_ApuStatus_5015				= $5015

PRGMode_5100					= $5100
CHRMode_5101					= $5101
PRGRAMProtect_5102				= $5102
PRGRAMProtect_5103				= $5103

RAMMode_5104					= $5104
NTMapping_5105					= $5105

FillModeTile_5106				= $5106
FillModeColor_5107				= $5107

Prg6000_5113            		= $5113
Prg8000_5114					= $5114
PrgA000_5115					= $5115
PrgC000_5116					= $5116
PrgE000_5117					= $5117

Chr0000_SPR_5120				= $5120
Chr0400_SPR_5121				= $5121
Chr0800_SPR_5122				= $5122
Chr0C00_SPR_5123				= $5123
Chr1000_SPR_5124				= $5124
Chr1400_SPR_5125				= $5125
Chr1800_SPR_5126				= $5126
Chr1C00_SPR_5127				= $5127
Chr000_BG_5128					= $5128
Chr400_BG_5129					= $5129
Chr800_BG_512a					= $512a
ChrC00_BG_512b					= $512b
ChrUpperBits_5130				= $5130

VerticalSplitMode_5200			= $5200
VerticalSplitScroll_5201		= $5201
VerticalSplitBank_5202			= $5202

IRQScanline_5203				= $5203
ScanlineIRQStatus_5204			= $5204

Multiplicand_5205				= $5205
Multiplier_5206					= $5206
ProductLo_5205					= $5205
ProductHi_5206					= $5206


; NES RAM
Temp							= $00 ; 32 bytes, $00-$1f

NMIDone 						= $20

PpuControl_Copy					= $21
PpuMask_Copy					= $22

SpriteIndex						= $23
SpriteBuffer					= $24 ; 4 bytes, $24-$27

CurrentBank6000					= $28
CurrentBank8000					= $29
CurrentBankA000					= $2a
CurrentBankC000					= $2b

KeyboardInputsOld				= $2c ; 9 bytes, $2c-$34
KeyboardInputs					= $35 ; 9 bytes, $35-$3d
KeyboardInputsNew				= $3e ; 9 bytes, $3e-$46

SpriteData						= $200 ; 256 bytes, $200-$2ff


; SRAM 0
FileSystemData					= $6000 ; 1024 bytes, $6000-$63ff
