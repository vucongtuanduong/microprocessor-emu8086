.Model Small
.Stack 100H
.Data
    endl DB 10, 13, 'Do dai chuoi ki tu ban dau la: $' 
    s DB 'vucongtuanduong$'
    loichao DB 10, 13, 'Chuoi ki tu ban dau: $'
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, loichao
    INT 21H 
    
    MOV AH, 9
    LEA DX, s
    INT 21H          
    
    MOV AH, 9
    LEA DX, endl   
    INT 21H       
    
    ; Count the length of the input string
    LEA SI, s   ; Load the offset of s into SI
    XOR BX, BX      ; BX will store the length of the string
    
    Dem:       
        MOV AL, [SI]    ; Load the character at SI into AL
        CMP AL, '$'     ; Check if AL is '$' (end of string)
        JE ketthuc      ; If yes, exit the loop
        INC SI          ; Move to the next character
        INC BX          ; Increment the length counter
        JMP Dem         ; Repeat the loop
    
    ketthuc:       
        
        MOV AX, BX
        MOV BX, 10
        XOR SI, SI
        lap1:
            XOR DX, DX
            DIV BX
            PUSH DX
            INC SI
            CMP AX, 0
            JNE lap1
        lap2:
            POP DX
            ADD DX, '0'  
            
            MOV AH, 2
            INT 21H
            
            DEC SI
            CMP SI, 0
            JNE lap2
            
             
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN
