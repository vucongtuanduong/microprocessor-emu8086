.Model Small
.Stack 120H
.Data  
    endl DB 13, 10, '$'  
    nhapvao DB 'Moi ban nhap vao chuoi ki tu: $'
    inra DB 'Chuoi ban nhap vao la: $'

.Code
   MAIN PROC  
    MOV AX, @Data
    MOV DS, AX  
    
    MOV AH, 9
    LEA DX, nhapvao
    INT 21H 
    
    MOV AH, 1     

input:
    INT 21H
    CMP AL, '#'
    JE continue
    PUSH AX
    JMP input
    
continue:    
    MOV AH, 9
    LEA DX, endl
    INT 21H      
    MOV AH, 9
    LEA DX, inra
    INT 21H
    MOV AH, 2

print:    
    CMP SP, 120H
    JE EXIT    
    POP DX
    INT 21H
    JMP print
    
EXIT:    
    MOV AH, 4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP