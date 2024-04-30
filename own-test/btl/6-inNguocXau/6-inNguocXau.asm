.MODEL Small
.STACK 100H
.DATA
    endl DB 10, 13, '$'
    input DB 100 DUP('$') 
    nhapvao DB 'Nhap chuoi ki tu: $'  
    reversed DB 10, 13, 'Chuoi ki tu viet nguoc lai: $', 10, 13
    
.CODE
    MAIN PROC   
        MOV AX, @Data
        MOV DS, AX  
        
        MOV AH, 9
        LEA DX, nhapvao
        INT 21H 
        
        MOV AH, 0Ah     ; Read string function
        LEA DX, input
        INT 21H 
           
        LEA SI, input + 2    ; Start of string after the length byte
        
        ; Find the end of the string
        mov cx, 0            ; Counter to find the length
        findLength:
            mov al, [si]     ; Load the character at SI
            cmp al, '$'     ; Check if it's the end of the string
            je endFindLength ; If it is, exit the loop
            inc cx           ; Increment the length counter
            inc si           ; Move to the next character
            jmp findLength  ; Repeat the loop
        endFindLength:
        
        MOV AH, 9
        LEA DX, reversed
        INT 21H
        
        MOV AH, 9
        LEA DX, endl
        INT 21H
        
        ; Print the string in reverse order
        mov bx, offset endl  ; BX points to the end-of-line characters
        printLoop:
            dec si            ; Move SI back to the last character
            mov dl, [si]      ; Load the character into DL
            mov ah, 02h       ; Function to print a character
            int 21h           ; Print the character
            cmp si, offset input + 2  ; Check if SI is back to the start of the string
            jne printLoop    ; If not, repeat the loop
        
        MOV AH, 4CH      ; Exit program
        INT 21H   
        
    MAIN ENDP   
    
END MAIN
