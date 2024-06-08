.model small
.stack 100h
.data
    endl db 13, 10, '$'
    base_10 dw 10 
    x dw 0
    
cout macro line
    mov ah, 9
    lea dx, line
    int 21h
endm
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    call input
    mov cx, x
    mov ax, 1
    calc:
        mul cx
        loop calc
        
    mov x, ax
    cout endl
    
    call output
    
    
    mov ah, 4ch
    int 21h
    
main endp 

input proc
    mov x, 0
    loop_input:
        mov ah, 1
        int 21h
        cmp al, 13
        je end_input
        xor ah, ah  
        sub al, '0'
        push ax    
        mov ax, x
        mul base_10
        mov x, ax
        pop ax
        add x, ax
        jmp loop_input
    end_input:
        ret
output proc
    mov ax, x
    xor cx, cx
    
    divide:
    
        xor dx, dx
        div base_10
        push dx  
        inc cx
        cmp ax, 0
        je print
        jmp divide
    print:
        mov ah, 2
        pop dx
        add dl, '0'
        int 21h  
        
        loop print
    ret
    
        
    
output endp
