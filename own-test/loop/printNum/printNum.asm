.Model Small
.Stack 100
.Data
    endl DB 10, 13, 'Ketquala', 10, 13, '$'
    str DB 20 dup('$')
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 10
    LEA DX, str
    INT 21H
    
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    LEA SI, str + 2
    
    PrintDigit:
        MOV AL, [SI]
        CMP AL, '$'
        JE EndPrintDigit
        
        CMP AL, '0'
        JL NotDigit
        
        CMP AL, '9'
        JG NotDigit
        
        MOV AH, 2
        MOV DL, [SI]
        INT 21H
    NotDigit:
        INC SI 
        JMP PrintDigit
    EndPrintDigit:
    
    MOV AH, 4CH
    INT 21H
    
    
    MAIN ENDP
end
        
     