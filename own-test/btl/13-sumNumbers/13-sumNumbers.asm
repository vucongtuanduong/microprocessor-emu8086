.model small
.stack 100h
.data
    x dw 0
    sum dw 0
    endl db 13, 10, '$'
    length dw 0
    nhapdodai db 'Nhap so luong so: $' 
    ketqua db 'Tong cac so ban vua nhap: $'
    base_10 dw 10

cout macro line
    mov ah, 9
    lea dx, line
    int 21h
endm    
.code
main proc   
    mov ax, @data
    mov ds, ax
    
    cout nhapdodai
    
    call input
    mov cx, x
    
    cout endl
    
    input_array:
        call input
        mov ax, sum
        add ax, x
        mov sum, ax
        loop input_array 
        
    cout ketqua
    call output
    
    mov ah, 4ch
    int 21h


main endp

input proc  
        mov x, 0
    input_loop:
        mov ah, 1 
        int 21h
        cmp al, 13
        je end_input
        cmp al, ' '
        je end_input
        sub al, '0'
        xor ah, ah
        push ax
        mov ax, x
        mul base_10
        mov x, ax
        pop ax
        add x, ax
        jmp input_loop
     
     end_input:
        ret
    
input endp

output proc 
    mov ax, sum
    xor cx, cx
    divide:
        xor  dx, dx
        div  base_10
        push dx   
        inc cx
        cmp ax, 0
        je print
        jmp divide
    print:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop print
    ret

output endp