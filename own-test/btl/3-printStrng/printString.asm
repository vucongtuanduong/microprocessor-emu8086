.Model Small
.Stack 100H
.Data
    endl DB 10, 13, 'Chuoi ban nhap la', 10, 13, '$'
    str DB 21, 20 dup('$')  
    loichao DB 10, 13, 'Moi ban nhap chuoi: $'
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 9        ; function to print the loichao out the screen
    LEA DX, loichao
    INT 21H         
    
    MOV AH, 10     ; Function 10 - Buffered Input
    LEA DX, str     ; DX points to the buffer for input
    INT 21H    
    
    MOV AH, 9
    LEA DX, endl   ; Load the offset of endl into DX
    INT 21H        ; Print the string "Chuoi ban nhap la"
   
    MOV AH, 9
    LEA DX, str+2   ; Load the offset of str+2 into DX
    INT 21H        ; Print the input string
   
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
