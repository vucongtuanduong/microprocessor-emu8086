.Model Small
.Stack 100H
.Data
    array DW 10 DUP(?)
    endl DB 10, 13, '$'
    res DW 0
    buffer DW 10 DUP('$')
    a DW ?
.Code   
    MAIN PROC
        MOV AX, @Data
        MOV DS, AX
        MOV ES, AX
        CALL Nhap
        CALL Xuly
        CALL Xuat  
        MOV AH, 9
        LEA DX, endl
        INT 21H     
        LEA DX, buffer
        INT 21H
        MOV AH, 4CH
        INT 21H
    ENDP MAIN
    
    Xuat PROC
        LEA SI, buffer; load the address of buffer into the source index register 'SI'
        MOV [SI], '0'; set the first character in the buffer to '0'
        MOV AX, res;load the sum of numbers divisible by 7 to the 'AX' register
        MOV BX, 10 ; load bx = 10 to prepare for dividing bx to get each digit
        MOV CX, SP ; prepare to convert the sum to ascii character to print out
        
        DONE1:
            CMP AX, 0 ; compare ax to 0 - when ax = 0 that means the reach the final digit of res
            JE DONE2; if then, jump to done2
            
            XOR DX, DX ; if not, first init DX = 0, DX will store the remainder of the division
            DIV BX;     divide AX TO BX and store the remainder(the digit) into DX, store the result into AX
            ADD DX, '0'; convert the remainder to ascii
            PUSH DX; push DX into the stack
            JMP DONE1;loop till AX = 0  
        DONE2:
            MOV BX, SP ; load the stack into BX
            CMP BX, CX ; compare with the original stack
                       ; if the BX is equal to CX, it means all the remainders have been pushed onto the stack, and the buffer is full. This condition is checked
                       ; to terminate the loop that stores the remainders in the buffer
            JE X
            POP DX; pop the top of the stack(ASCII character) 
            MOV [SI], DX; stores it in the buffer - buffer address is load into the source index register already
            INC SI
            JMP DONE2
        X:
            RET 
        Xuat ENDP
            
     Xuly PROC 
        MOV SI, offset array ;mov the memory address of the array variable into the SI register, allowing us to access the array through indirect addressing using SI
        MOV CX, 10
        MOV BX, 7
        
        LABEL:
            XOR DX, DX; DX = 0
            MOV AX, [SI];get the value from the memory location pointed to by SI and stores it in the AX register
            DIV BX
            CMP DX, 0; compare the remainders to 0 to check if divisible by 7
            JE TONG
            INC SI
            INC SI
            LOOP LABEL
            RET
        TONG:
            MOV AX, [SI]
            ADD RES, AX    
            INC SI
            INC SI
            LOOP LABEL
            RET
        Xuly ENDP     
     
     
     Nhap PROC  
        
        LEA SI, array;load the effective address(memory address) of the array into the SI  register, set SI point to the beginning of the array
        MOV AH, 8;set the function code 8 in the AH register. Function 8 is used for buffered input, allowing the user to input a string terminaed by the Enter key
        
        MOV CX, 10; set the counter CX to 10, meaning that we want to input a total of 10 numbers
        
        MOV BH, 10;BH is used to hold the base for conversion from ascii to base10- 10 here is the base
        
        START:
            INT 21H
            CMP AL, 32; compare the value in teh AL register with the value 32 in the ascii (the space character)
                      ; check if the input character is space
            JE TANG1
            
            CMP AL, 13;check if the input character is a carriage return, meaning the end of user input 
            JE TANG2   
            
            ;check if the input is number in ascii
            CMP AL,'0'
            JL START
            CMP AL,'9'
            JG START                              
            ;if the input is not a digit, restart the input process
            
            MOV AH, 02; load the value '02H' into the AH register, which is the bios function code for displaying a character
            MOV a, DX;copy the value of DX register-holding the ascii code of the character to be printed into the memory location a.
                     ;to preserve the orginal value of DX because it will be used later in the code
            MOV DL, AL;copy the value in the AL register-holding the ascii code of the character to be printed into the DL register, which is the register used to pass the character to be printed to the BIOS interupt
                      ;move the character in AL into DL for printiing
                      
            INT 21H                    
            MOV DX, a;restore the original value of DX
            SUB AL, '0'; get the numerical value of input character
            
            MOV BL, AL;copy the numerical value to BL
            MOV AX, DX;move the original value of dx to ax
            
            MUL BH;multiply AX by BH(10)
            XOR BH, BH;clear BH
            ADD AX, BX;add the value in BX(which holds the numerical value of the input character before conversion)to AX. this combines the tens and unites place
            MOV BH, 10;set BH to 10 to convert to decimal
            MOV DX, AX;move the result back to DX for printing
            
            XOR AX, AX;clear AX
            MOV AH, 08;bios function to display a character
            JMP START
                        
        TANG1:
            MOV AH, 02;bios function for displaying a character
            MOV a, DX;store the value of DX(input character)into 'a'
            
            MOV DL, AL;move the input character from AL TO DL for printing
            INT 21H
            MOV AH, 08;bios function code for reading a character
            MOV DX, a;restore the original value of DX from 'a'
            MOV [SI], DX;store the character entered by the user into the array at the position pointed to by SI
            INC SI
            INC SI
            XOR DX, DX;DX = 0
            LOOP START
            RET   
        TANG2: 
            MOV a, DX;store the value of DX(the input character) into the variable 'a'
            LEA DX, endl;load the offset address of endl variable
            MOV AH, 9;display a string
            INT 21H
            MOV AH, 08;read a character
            MOV DX, a;restore the original value of dx from the variable 'a'
            MOV [SI], DX;store the character entered by the user into the array at the position pointed to by SI
            INC SI
            INC SI
            XOR DX, DX
            LOOP START
            RET
            
            
            
        
        NHAP ENDP
     
     
            
             
        
        
        
            
            
        
        
    