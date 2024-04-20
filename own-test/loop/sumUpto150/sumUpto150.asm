.Model Small
.Stack 100
.Data
    endl DB 10,13, 'Ket qua la', 10, 13, '$'
    str DB 'KTMT_2024$'
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV SI, 150
    XOR BX, BX
    Lap:
        ADD BX, SI
        DEC SI
        CMP SI, 0
        JNE Lap
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    MOV AX, BX
    MOV BX, 10
    XOR SI, SI
    Lap1:
       XOR DX, DX
       DIV BX
       PUSH DX
       INC SI
       
       CMP AX, 0
       JNE Lap1
      
    Lap2:
        POP DX
        ADD DX, '0'
        MOV AH, 2
        INT 21H
        
        DEC SI
        CMP SI, 0
        JNE Lap2
    MOV AH, 4CH
    INT 21H
    
    MAIN Endp
END
        