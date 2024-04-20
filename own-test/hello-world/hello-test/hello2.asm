.Model Small
.Stack 100H
.Data
      CLRF DB 13, 10, '$'
      Message DB 'Hello!$'
      My_name DB 'I am Duong$'
.Code
MAIN Proc
        MOV AX, @Data
        MOV DS, AX
        
        MOV AH, 9   
        LEA DX, Message
        INT 21H  
        
        
        ; xuong 10 dong
        LEA DX, CLRF
        INT 21H
        MOV CX, 11
LAP:
        INT 21H
        LOOP LAP
        
        MOV AH, 9
        LEA DX, My_name
        INT 21H
        
        ; ket thuc chuong trinh
        MOV AH, 4CH
        INT 21H
MAIN Endp
        END MAIN
        