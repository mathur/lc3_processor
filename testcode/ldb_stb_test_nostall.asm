ORIGIN 4x0000 

SEGMENT  CodeSegment:
	LEA R0, DATA
	nop
	nop
	nop
	nop
	nop
	nop
; Test LDB, STB
	ldb r6, r0, LowByte       ;0
	nop
	nop
	nop
	nop
	nop
	nop
;MAR < 8
;MDR < (M[8] = 4x600D)
;R6 < 4x00 & 4x0D
    ldb r7, r0, HighByte      ;2
    nop
	nop
	nop
	nop
	nop
	nop

; MAR < 8 or 9
; MDR < (M[8] = 4x600D)
; R7 < 4x00 & 4x60
    stb r6, r0, LowSByte      ;4
    nop
	nop
	nop
	nop
	nop
	nop
; MAR < 10
; MDR < 4xXX & (R6(7:0) = 4x0D)
; *only* MWRITEL_L is active (=0).
; M[10] < 4x0D
    stb r7, r0, HighSByte    ;6
    nop
	nop
	nop
	nop
	nop
	nop

	BRnzp HALT

;; Loop forever
HALT:
    nop
	nop
	nop
	nop
	nop
	nop
	BRnzp HALT
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

;MAR < 10 or 11
;MDR < (R7(7:0) = 4x60) & 4xXX
;*only* MWRITEH_L is active (=0).
;M[11] < 4x60
SEGMENT
DATA:
	LowByte:      DATA1 4x0D ;8
	HighByte:     DATA1 4x60 ;9
	LowSByte:     DATA1 ?    ;10
	HighSByte:    DATA1 ?    ;11