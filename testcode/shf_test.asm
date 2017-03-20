ORIGIN 4x0000 

SEGMENT  CodeSegment:

;; Clear Regs first
AND R0, R0, 0
AND R1, R1, 0
AND R3, R3, 0
AND R4, R4, 0

;; Load R3 with 1, when left shifted, should becoome 2
ADD R3, R3, 1
;; Result in R4
LSHF R4, R3, 1

;; Right shift 2 to 1
ADD R1, R1, 2
;; Store result in R4
RSHFL R4, R1, 1

;; Load -4 into R0
ADD R0, R0, -4
;; Shift arithmetic and store
RSHFA R4, R0, 1 




	BRnzp HALT

;; Loop forever
HALT:
	BRnzp HALT