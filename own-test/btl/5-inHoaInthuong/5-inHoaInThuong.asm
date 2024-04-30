.Model Small
.Stack 100H
.Data
    endl DB 10, 13, '$'
    input DB 20 DUP('$') 
    vietthuong DB 10, 13, 'Chuoi viet thuong la: $'
    viethoa DB 10, 13, 'Chuoi viet hoa la: $'
    nhapvao DB 'Nhap chuoi ki tu: $'
    
.Code
    MAIN PROC   
        MOV AX, @Data
        MOV DS, AX  
        
        MOV AH, 9
        LEA DX, nhapvao
        INT 21H 
        
        MOV AH, 10;enter a string
        LEA DX, input
        INT 21H 
        
        MOV AH, 9
        LEA DX, viethoa
        INT 21H  
        
        CALL printUpper
        
        MOV AH, 9
        LEA DX, vietthuong
        INT 21H
        CALL printLower   
        
        MOV AH, 4CH
        INT 21H   
        
        MAIN ENDP   
    
    printUpper PROC  
        LEA SI, input + 2
                  
        upperLoop:  
            MOV DL, [SI]
            CMP DL, 'a'
            JL INRA
            CMP DL, 'z'
            JG INRA
            SUB DL, 32
           
        INRA:       
            MOV AH, 2
            INT 21H
            INC SI
            CMP [SI], '$'
            JNE upperLoop
            RET
        
        printUpper ENDP
        
        
    printLower PROC    
        
        LEA SI, input + 2
        
        lowerLoop:
            MOV DL, [SI]
            CMP DL, 'A'
            JL INRA2
            CMP DL, 'Z'
            JG INRA2
            ADD DL, 32 
            
        INRA2:       
            MOV AH, 2
            INT 21H
            INC SI
            CMP [SI], '$'
            JNE lowerLoop 
            RET               
        printLower ENDP    
        
END MAIN            
        
        
        