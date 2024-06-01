.Model Small
.Stack 100H
.Data
   DK_LED EQU 1F0H
.Code
    MAIN PROC
        MOV AX, @Data
        MOV DS, AX
        LAP:
            MOV AL, 0FFH
            MOV DX, DK_LED
            OUT DX, AL
            MOV CX, 200  
        TRE_1: NOP
        
            LOOP TRE_1
            XOR AL, AL 
            OUT DX, AL
            MOV CX, 200
        TRE_2: NOP
            LOOP TRE_2
            JMP LAP
             
        
        MAIN ENDP
    