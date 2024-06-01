.Model Small
.Stack 100H
.Data
   DK_LED EQU 2C0H; CONG DIEU KHIEN LED
   
.Code
   ;TAT CA CAC DEN BAT TAT- BAT TAT
MAIN PROC
    LAP:
        MOV AL, 0FFH; TAT TAT CA DEN LED
        MOV DX, DK_LED
        OUT DX, AL
        MOV CX, 64
    TRE_1: NOP
        LOOP TRE_1
        XOR AL, AL ; AL = 0
        OUT DX, AL
        MOV CX, 64
    TRE_2: NOP
        LOOP TRE_2
        JMP LAP    
    
    MAIN ENDP