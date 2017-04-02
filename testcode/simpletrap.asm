ORIGIN 4x0000 

SEGMENT  CodeSegment:
;; Going to do R4 = R1 + R3, but using NOT
;; This is to test the functionality of the TRAP function.
;; Instead of using a JSR, a TRAP is called, but the effect should be the same
ADD R1, R1, 7
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
ADD R3, R3, 2
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
ADD R0, R3, 0
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Call TRAP
TRAP cagey
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Move return val to dest
AND R3, R3, 0
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
ADD R3, R0, 0
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
;; Do Subtraction
ADD R4, R1, R3
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
	BRnzp HALT
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
;; Loop forever
HALT:
	BRnzp HALT
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP


cagey: DATA2 NEGATE

;; Uses the two's compliment method to make a number negative
;; Input is R0, Output is R0
NEGATE:
	NOT R0, R0
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	ADD R0, R0, 1
	RET
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
