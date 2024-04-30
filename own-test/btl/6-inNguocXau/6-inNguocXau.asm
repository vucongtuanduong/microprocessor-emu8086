.MODEL Small
.STACK 100H
.DATA
    endl DB 10, 13, '$'
    input DB 100 DUP('$') 
    nhapvao DB 'Nhap chuoi ki tu: $'
    
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
        
        ; Print the message for uppercase string
        MOV AH, 9
        LEA DX, viethoa
        INT 21H  
        
        CALL printUpper   ; Call the procedure to print uppercase string
        
        ; Print the message for lowercase string
        MOV AH, 9
        LEA DX, vietthuong
        INT 21H
        
        CALL printLower   ; Call the procedure to print lowercase string   
        
        MOV AH, 4CH      ; Exit program
        INT 21H   
        
    MAIN ENDP   
    
       
        
END MAIN
