.model small
.stack 100h
.data
    endl db 10, 13 , '$'
    inlonnhat db 13, 10, 'So lon nhat trong mang: $'
    innhonhat db 13, 10, 'So nho nhat trong mang: $'
    x dw 0
    y dw 0
    min dw 9999
    max dw 0 
    base_10 dw 10  
    length db 'Nhap do dai mang: $'
cout macro line
    mov ah, 9
    lea dx, line
    int 21h
    
endm
        
.code
main proc
    mov ax, @data
    mov ds, ax
    
    cout length
    
    call input
    mov cx, x
    
    cout endl
     
    input_array:
        call input
        mov bx, x
        cmp bx, max
        jl find_min
        mov max, bx
    find_min:
        cmp bx, min
        jg continue
        mov min, bx
    continue:
        loop input_array
        
        
    mov bx, max
    mov x, bx
    
    cout inlonnhat
    call output
    
    mov bx, min
    mov x, bx
    
    cout innhonhat
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
        cmp al, ' '
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
input endp


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