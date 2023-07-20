; Filesystem Format
;
; Filesystem data is between $6100-$67ff (1792 bytes) in SRAM bank 0
;
; Format:
;	Byte 0: Basic Info
;		E---TTTT
;		|   ++++-- File Type
;		+--------- File Exists
;
;	Byte 1: Folder Info
;		H--FFFFF
;		|  +++++-- Folder ID
;		+--------- Stored In Home Folder
;
;	Bytes 2-18: Name
;		CCCCCCCC
;		++++++++-- Character
;
;	Byte 19: File Extension Position
;		----IIII
;		    ++++-- Index into file name to place period and file extension
;
;	Bytes 20-22: File Extension
;		CCCCCCCC
;		++++++++-- Character
;
;	Byte 23: Page Count
;		---PPPPP
;		   +++++-- Amount of 256-byte pages the file uses (32 page max, or 8 KB)
;
;	Bytes 24- up to 119: Location Of Page(s)
;		LLLLLLLL HHHHHHHH BBBBBBBB
;		|||||||| |||||||| ++++++++-- Bank
;		|||||||| ++++++++----------- Addr High Byte
;		++++++++-------------------- Addr Low Byte

