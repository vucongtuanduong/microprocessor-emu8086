.Model Small
.Stack 100H
.Data
buffer DW 6 DUP('$')
buffer1 DW 17 DUP('$') ; Increased size for binary string
endl DB 13,10,'$'
.Code
Main PROC
MOV AX,@Data       
MOV DS,AX          
MOV ES,AX          
CALL NHAP          
CALL XUAT          
MOV AH,9           
LEA DX,endl        
INT 21H            
LEA DX,buffer1     
INT 21H            
MOV AH,4CH         
INT 21H            
Main ENDP 

Nhap PROC
MOV AH,0AH         
LEA DX,buffer      
INT 21H            
MOV CX,0           
MOV BX,2           ; Change to 2 for binary conversion
MOV SI, OFFSET buffer+2 
XOR AX,AX          

ConvertLOOP:
MOV CL,[SI]        
CMP CL,13          
JE X               
SUB CL,'0'         
MUL BX             
ADD AX,CX          
INC SI             
JMP ConvertLOOP    

XUAT PROC
MOV SI,SP          
MOV BX,2           ; Change to 2 for binary conversion

CONVERT:
CMP AX,0           
JE DONE1           
XOR DX,DX          
DIV BX             
PUSH DX            
JMP CONVERT        

DONE1:
LEA DI, buffer1    

DONE2:
MOV CX,SP          
CMP SI,CX          
JE X               
POP [DI]           
ADD [DI],'0'       
INC DI             
JMP DONE2          

X: RET             

END
