.Model Small
.Stack 100H
.Data
      CLRF DB 13, 10, '$'
      Message DB 'Hello!$'
.Code
MAIN Proc
        MOV AX, @Data
        MOV DS, AX
        
        MOV AH, 9   
        LEA DX, Message
        INT 21H
MAIN Endp
        END MAIN
        