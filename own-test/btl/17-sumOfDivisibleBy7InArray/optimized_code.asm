.Model Small
.Stack 100H
.Data
    endl DB 13, 10, '$'
    base_dec DW 10
    base_bin DW 2
    base_hex DW 16
    x DW 0
    SUM DW 0
    len DW 10
    ketqua DB 13, 10, 'Tong cac so chia het cho 7: $'
.Code
    MAIN PROC   
        MOV AX, @Data
        MOV DS, AX
        
        MOV CX, len
        
        MOV AH, 9
        LEA DX, endl
        INT 21H
        
        input_array:
            CALL input  
            
            MOV AX, x
            XOR DH, DH
            MOV DL, 7
            DIV DL
            CMP AH, 0
            JNE continue
            MOV AX, SUM
            ADD AX, X
            MOV SUM, AX
            
         continue:
            LOOP input_array
            
            
         MOV AH, 9
         LEA DX, ketqua
         INT 21H
         CALL output  
         
         MOV AH, 4CH
         INT 21H
        
        
        MAIN ENDP     
    
    input PROC
        MOV x, 0
        
        
        loop_input:
            MOV AH, 1
            INT 21H
            CMP AL, 13
            JE end_input
            CMP AL, ' '
            JE end_input
            MOV AH, 0
            SUB AL, '0'
            PUSH AX
            MOV AX, x
            MUL base_dec
            MOV X, AX
            POP AX
            ADD X, AX
            JMP loop_input
        
        end_input:
            ret    
            
    input ENDP 
    
    
    output PROC
       MOV AX, SUM
       XOR CX, CX
       
       DIVIDE:
            XOR DX, DX
            DIV base_dec
            PUSH DX
            INC CX
            CMP AX, 0
            JE SHOW
            JMP DIVIDE 
       SHOW:
            MOV AH, 2
            POP DX
            ADD DL, '0'
            INT 21H
            DEC CX
            CMP CX, 0
            JNE SHOW
        RET
     output ENDP    
     
            
        
    