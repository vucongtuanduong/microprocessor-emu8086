.model small
.stack 100h
.data
     endl db 13, 10, '$'
     error db 'Invalid!$'
     base_10 dw 10
     base_2 dw 2
     base_16 dw 16
     str db '0123456789ABCDEF$'
     
     n dw 0
     
cout macro line
    mov ah, 9
    lea dx, line
    int 21h
endm
.code
main proc
    
    mov ax, @data
    mov ds, ax
        
    mov cx, 0
    call input
    
    cout endl
    
    call convert
    
    mov ah, 4ch
    int 21h
    
main endp
input proc
    loop_input:
        mov ah, 1
        int 21h
        cmp al, '#'
        je end_input
        cmp al, '1'
        je calc
        cmp al, '0'
        je calc
        cout error
        jmp loop_input
        
    calc: 
        inc cx
        mov ah, 0
        sub al, '0'
        push ax
        mov ax, n
        mul base_2 
        mov n, ax
        pop ax   
        add n, ax
        cmp cx, 8
        je end_input
        jmp loop_input
    end_input:
        ret
        
        
        
   
input endp


convert proc 
    mov ax, n
    mov cx, 0
    loop_output:
        mov dx, 0
        div base_16
        push dx
        inc cx
        cmp ax, 0
        jg loop_output
        
        mov ah, 2
    print:
        pop si
        add si, (str)
        mov dl, [si]
        int 21h
        loop print
    ret
    
convert endp