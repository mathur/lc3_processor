ORIGIN 0
SEGMENT  CodeSegment:
	ADD R3, R3, 5
	ADD R2, R3, -2
	AND R1, R2, R3
	ADD R6, R1, 9
	NOP
	NOP
	NOP
	NOP
	NOP
	BRnzp HALT
HALT:
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
