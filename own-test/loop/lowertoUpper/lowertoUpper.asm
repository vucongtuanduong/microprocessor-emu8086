.Model Small
.Stack 100H
.Data
    endl DB 10,13,'Ket qua la', 10, 13, '$'
    str DB 20 DUP ('$')
.Code
MAIN Proc
    MOV AX, @Data 
    MOV DS, AX
    ;MOV ES, AX
      
    MOV AH, 10
    LEA DX, str
    INT 21H
    
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    LEA SI, str + 2
    
    InHoa:
        MOV DL, [SI]
        CMP DL, 'a'
        JL InRa
        CMP DL, 'z'
        JG InRa
        
        SUB DL, 32
    InRa:
        MOV AH, 2
        INT 21H
        
        INC SI
        CMP [SI], '$'
        JNE InHoa
    MOV AH, 4CH
    INT 21H
    
    
                       
MAIN Endp
END MAIN