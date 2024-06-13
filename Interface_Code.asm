MOV A, #38H //Use 2 lines and 5x8 matrix,last 5 bits for cursor
ACALL CMND
MOV A, #0FH // Display ON, cursor ON, cursor blinking ON
ACALL CMND
MOV A, #01H //Clear display and set DDRAM address to 0 in AC.
ACALL CMND
MOV A, #06H //Moving direction is to increment cursor
ACALL CMND
// Here initialization ends
// below we want to print 16X2 LCD
MOV A, #49D // Number 1
ACALL DISP
MOV A, #54D // Number 6
ACALL DISP
MOV A, #88D // letter X
ACALL DISP
MOV A, #50D // 2
ACALL DISP
MOV A, #32D // space
ACALL DISP
MOV A, #76D // L
ACALL DISP
MOV A, #67D // C
ACALL DISP
MOV A, #68D // D
ACALL DISP
HERE: SJMP HERE
CMND: 
MOV P1, A
CLR P3.5
CLR P3.4
SETB P3.3
CLR P3.3
ACALL DELY
RET
DISP:
MOV P1, A
SETB P3.5
CLR P3.4
SETB P3.3
CLR P3.3
ACALL DELY
RET
DELAY: 
MOV R6, #250D
MOV R7, #250D
LABEL1: DJNZ R6, LABEL1
LABEL2: DJNZ R7, LABEL2
RET
END
