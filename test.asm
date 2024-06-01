.Model Small
.Stack 100H
.Data
   DK_LED EQU 1F0H
.Code
    MAIN PROC
        MOV AX, @Data
        MOV DS, AX
        MOV CL, 03H
        MOV AL, 5CH
        SHL AL, CL
             
        
        MAIN ENDP
    