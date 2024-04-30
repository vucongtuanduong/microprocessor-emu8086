.Model Small
.Stack 100H 
.Data
    endl DB 10, 13, '$'
    input DB ?
    nhapvao DB 'Nhap mot ki tu in thuong: $'
    inra DB 10, 13, 'Sau khi doi thanh ki tu in hoa: $'
    
.Code
MAIN PROC
    MOV AX, @Data   
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, nhapvao
    INT 21H        
    
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    MOV AH, 01H  ;luu vao AL
    INT 21H
    
    
    SUB AL, 32
    MOV input, AL  
    
    
    MOV AH, 9
    LEA DX, inra
    INT 21H
    
    MOV AH, 02H
    MOV DL, input
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP