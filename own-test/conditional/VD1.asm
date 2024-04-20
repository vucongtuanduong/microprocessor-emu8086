.Model Small
.Stack 100H
.Data
    CRLF DB 13, 10, '$' 
    ChaoTay DB 'Hello!$'
    ChaoTa DB 'Xin chao!$'
.Code
MAIN Proc
    MOV AX, @Data;
    MOV DS, AX
    
    
    MOV AH, 9
    LEA DX, ChaoTay
    INT 21H
    
    LEA DX, CRLF
    INT 21H
    MOV CX, 6
LAP:
    INT 21H
    LOOP LAP
    
    
    MOV AH, 9
    LEA DX, ChaoTa
    INT 21H 
    
    
    MOV AH, 4CH
    INT 21H
MAIN Endp
    END MAIN