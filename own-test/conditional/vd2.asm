.Model Small
.Stack 100H
.Data
    str1 DB 'a', '5', 'B', '?', 'd', 'g', 'P', 'N', 'k', '*'
         DB 10, 13, '$'  
    str2 DB 10 DUP('')
         DB '$'
.Code
MAIN Proc
   MOV AX, @Data
   MOV DS, AX
   MOV ES, AX
   ; Thiet lap SI tro toi str1 va DI tro toi str2
   LEA SI, str1
   LEA DI, str2
   CLD
   MOV CX, 10
START:
    LODSB
    CMP AL, 'a'
    JL NotLowerCase
    CMP AL, 'z'
    JG NotLowerCase
    SUB AL, 20H
NotLowerCase:
    STOSB
    LOOP START
    LEA DX, str1
    MOV AH, 9
    INT 21H
    LEA DX,  str2
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN Endp