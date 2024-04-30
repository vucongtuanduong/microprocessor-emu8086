.Model Small
.Stack 100H
.Data
    endl DB 10, 13, '$'
    chaota DB 'Xin chao!$'       
    chaotay DB 'Hello$'
.Code
MAIN PROC    
    
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, chaota
    INT 21H
    
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    MOV AH, 9
    LEA DX, chaotay
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
     
     
    
    MAIN ENDP 