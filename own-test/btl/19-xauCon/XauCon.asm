.MODEL SMALL
.STACK 100H
.DATA
S DB 50 DUP('$')
S1 DB 50 DUP('$')
CRLF DB 10,13,'$'
YES DB 13,10,'YES$'
NO DB 13,10,'NO$'
ANS DB 0
FIRST DW 0
LAST DW 0
BUFFER DB 6 DUP('$')
.CODE 
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV ES,AX
MOV AH,0AH
LEA DX,S
INT 21H 
CALL ENDL
MOV AH,0AH
LEA DX,S1
INT 21H
MOV SI,OFFSET S+2
MOV DI,OFFSET S1+2 
CALL SOLVE
CMP ANS,1
JE E1
LEA DX,NO
MOV AH,09
INT 21H
MOV AH,4CH
INT 21H
ENDP MAIN


SOLVE PROC
START:
CMP [DI],13
JE X1
CMP [SI],13
JE X
MOV BL,[DI]
MOV CL,[SI]
CMP BL,CL
JE X2
MOV DI,OFFSET S1+2
CONTINUE:
INC SI 
JMP START
X:
RET
X1:
MOV ANS,1
MOV BX,SI
MOV CX,OFFSET S+2
SUB BX,CX
MOV LAST,BX
MOV SI,OFFSET S1+1
MOV CL,[SI]
XOR CH,CH
SUB BX,CX
ADD BX,1
MOV FIRST,BX
RET
X2:
INC DI
JMP CONTINUE

 
ENDL PROC
LEA DX,CRLF
MOV AH,09
INT 21H
RET  

CONVERT PROC
XOR DX,DX
MOV BX,10
MOV CX,SP
LEA SI,BUFFER
MOV [SI],'0'
LAB:
CMP AX,0
JE DONE
XOR DX,DX
DIV BX
PUSH DX
JMP LAB
DONE:
MOV BX,SP
CMP BX,CX
JE DONE1:
POP DX
ADD DX,'0'
MOV [SI],DL
INC SI
JMP DONE
DONE1:
MOV AH,09
CALL ENDL
LEA DX,BUFFER
INT 21H
RET
ENDP CONVERT
       
E1:
LEA DX,YES
MOV AH,09
INT 21H
MOV AX,FIRST
CALL CONVERT
MOV AX,LAST
CALL CONVERT
MOV AH,4CH
INT 21H
ENDP MAIN
 
