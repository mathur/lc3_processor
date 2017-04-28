ORIGIN 4x0000 

SEGMENT  CodeSegment:

;; Load R3 with 1, when left shifted, should becoome 2
ADD R3, R3, 1
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Result in R4
LSHF R4, R3, 1
NOP
NOP
NOP
NOP
NOP
NOP
NOP

;; Right shift 2 to 1
ADD R1, R1, 2
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Store result in R4
RSHFL R4, R1, 1
NOP
NOP
NOP
NOP
NOP
NOP
NOP

;; Load -4 into R0
ADD R0, R0, -4
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Shift arithmetic and store
RSHFA R4, R0, 1
NOP
NOP
NOP
NOP
NOP
NOP
NOP
	BRnzp HALT

;; Loop forever
HALT:
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BRnzp HALT