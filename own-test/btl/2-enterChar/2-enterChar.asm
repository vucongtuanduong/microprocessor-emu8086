.Model Small     
.Stack 100H
.Data
    endl DB 10, 13, '$'
    input DB ?
    nhapvao DB 'Nhap vao mot ki tu: $'
    inra DB 10, 13, 'Ki tu ban da nhap la: $'
        
    
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
        
        MOV AH, 01H
        INT 21H
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
    