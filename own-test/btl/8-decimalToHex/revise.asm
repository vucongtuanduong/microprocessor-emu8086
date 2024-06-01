.model small
.stack 100h
.data
    endl db 13, 10, '$'
    n dw 0
    base_10 dw 10
    base_2 dw 2
    base_16 dw 16
    str db '0123456789ABCDEF'
    
.code
MAIN proc
         
    mov ax, @data
    mov ds, ax
    
    call input
    
    mov ah, 9
    lea dx, endl
    int 21h
    
    mov ax, n
    call output
    
    
    mov ah, 4ch
    int 21h
    
    
    
    
MAIN ENDP 

input proc
    
    input_loop: 
        mov ah, 1
        int 21h
        cmp al, 13
        je end_input
        sub al, '0'
        xor ah, ah
        push ax
        mov ax, n
        mul base_10
        mov n, ax
        
        pop ax
        add n, ax
        jmp input_loop
    end_input:
        ret
        
    
    
input endp

output proc
    mov cx, 0
    output_loop:
        xor dx, dx
        div base_16
        push dx
        inc cx
        cmp ax, 0
        jg output_loop
        
        mov ah, 2
    print:
        pop si
        add si, (str)
        mov dl, [si]
        int 21h
        loop print
    ret
    
    
output endp