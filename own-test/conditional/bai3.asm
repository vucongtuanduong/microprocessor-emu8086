.Model Small
.Stack 100H
.Data
    prompt_msg DB 'Enter a number (a): $'
    result_msg DB 'c = $'   
    newline db 13, 10, '$' 
    a DW ?
    b DW 2
    d DW 1
    c DW ?
    
.Code
MAIN Proc  
    ;init data segment
    MOV AX, @data
    MOV DS, AX
    
    ;prompt user to input a value for a
    MOV AH, 9
    LEA DX, prompt_msg
    INT 21h
    
    ;read the input
    MOV AH, 1
    INT 21h
    SUB AL, 30h
    MOV a, AX      
    
    CMP a, 
    JNL notless
    JMP lessthan 
    
    mov ah, 9
    lea dx, newline
    int 21h       
    
    mov ah, 9
    lea dx, result_msg
    int 21h
    
    mov ax, c
    add ax, 30h   ; Convert result to ASCII
    mov dl, al
    mov ah, 2
    int 21h
    
notless:
    MOV AX, b
    MOV BX, d
    ADD AX, BX
    MOV c, AX
    JMP display_result  ; Jump to display the result

lessthan:
    MOV AX, b
    MOV BX, d
    SUB AX, BX
    MOV c, AX

display_result:  ; Output section moved here
    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 9
    lea dx, result_msg
    int 21h

    mov ax, c
    add ax, 30h  ; Convert result to ASCII
    mov dl, al
    mov ah, 2
    int 21h

MAIN Endp  