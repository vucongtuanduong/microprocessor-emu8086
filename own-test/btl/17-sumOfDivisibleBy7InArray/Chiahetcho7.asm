.Model Small
.Stack 100H   
.Data
array DW 10 DUP(?)
endl DB 10,13,'$' 
ans DW 0
buffer DW 6 DUP('$')
a DW ?
.Code
MAIN Proc
MOV AX,@DATA
MOV DS,AX
MOV ES,AX
Call Nhap
CAll Slove 
CALL Xuat
MOV AH,9 
LEA DX,ENDL
INT 21H
LEA DX,buffer
INT 21H
MOV AH,4CH
INT 21H
ENDP MAIN 


Xuat proc
LEA SI,buffer
MOV [SI],'0'
MOV AX,ans
MOV BX,10
MOV CX,SP
DONE1:
CMP AX,0
JE DONE2
XOR DX,DX   
DIV BX
ADD DX,'0'
PUSH DX
JMP DONE1
DONE2:
MOV BX,SP
CMP BX,CX
JE X
POP DX
MOV [SI],DX
INC SI
JMP DONE2
X:
RET


 
Slove Proc
MOV SI, offset array
MOV CX,10
MOV BX,7 
LABEL:
XOR DX,DX 
MOV AX,[SI]
DIV BX
CMP DX,0
JE tong
INC SI
INC SI
LOOP Label
RET
tong:
MOV AX,[SI]
ADD ans,AX
INC SI
INC SI
LOOP LABEL
RET  





Nhap Proc
LEA SI,array
MOV AH,8
MOV CX,10 
MOV BH,10
Start:
INT 21H
CMP AL,32
JE tang1
CMP AL,13
JE tang2
CMP AL,'0'
JL Start
CMP AL,'9'
JG Start
MOV AH,02
MOV a,DX
MOV DL,AL
INT 21H
MOV DX,a
SUB AL,'0'
MOV BL,AL
MOV AX,DX
MUL BH
XOR BH,BH
ADD AX,BX
MOV BH,10
MOV DX,AX
XOR AX,AX
MOV AH,08
JMP Start
tang1:
MOV AH,02
MOV a,DX
MOV DL,AL
INT 21H
MOV AH,08
MOV DX,a
MOV [SI],DX
INC SI
INC SI
XOR DX,DX
LOOP Start
RET  
tang2:
MOV a,DX 
LEA DX,endl
MOV AH,9
INT 21H
MOV AH,08
MOV DX,a
MOV [SI],DX
INC SI
INC SI
XOR DX,DX
LOOP Start
RET