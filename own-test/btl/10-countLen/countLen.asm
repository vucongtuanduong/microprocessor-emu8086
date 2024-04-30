.Model Small
.Stack 100H
.Data
    endl DB 10, 13, 'Chuoi ban nhap la', 10, 13, '$'
    str DB 21, 20 dup('$')   ; Increased the size by 1 to accommodate '$' at the end
    loichao DB 10, 13, 'Do dai chuoi ban nhap la : $' ; Adjusted to remove extra CR, LF
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, loichao
    INT 21H         
    
    MOV AH, 10     ; Function 0Ah - Buffered Input
    LEA DX, str     ; DX points to the buffer for input
    INT 21H    
    
    MOV AH, 9
    LEA DX, endl   ; Load the offset of endl into DX
    INT 21H        ; Print the string "Chuoi ban nhap la"
    
    ; Count the length of the input string
    LEA SI, str+2   ; Load the offset of str+2 into SI
    XOR BX, BX      ; BX will store the length of the string
    
    Dem:       
        MOV AL, [SI]    ; Load the character at SI into AL
        CMP AL, '$'     ; Check if AL is '$' (end of string)
        JE ketthuc      ; If yes, exit the loop
        INC SI          ; Move to the next character
        INC BX          ; Increment the length counter
        JMP Dem         ; Repeat the loop
    
    ketthuc:       
        DEC BX
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
