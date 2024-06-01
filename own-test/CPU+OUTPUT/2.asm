.Model Small
.Stack 100H
.Data
   DK_LED EQU 1F0H 
   ;sang lan luot tu d4 - d7
.Code
    MAIN PROC
        MOV AX, @Data
        MOV DS, AX
        LAP:
            MOV AL, 08H
            MOV DX, DK_LED
            OUT DX, AL
            MOV CX, 300  
        TRE_1: NOP
        
            LOOP TRE_1 
        LAP_1:    
            SHR AL, 1
            INC AL 
            OUT DX, AL
            MOV CX, 300
        TRE_2: NOP
            LOOP TRE_2
            JMP LAP_1
             
        
        MAIN ENDP
    