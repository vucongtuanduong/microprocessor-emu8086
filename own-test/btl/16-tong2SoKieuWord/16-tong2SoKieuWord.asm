.model small
.stack 100h
.data    
    endl db 13, 10, '$'
    x dw 0   
    a dw 0
    b dw 0
    nhapa db 10, 13,  'Nhap a: $'
    nhapb db 10, 13, 'Nhap b: $' 
    ketqua db 10, 13, 'a + b = $'
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
               
    cout nhapa
    
    call input
    mov bx, x
    
    cout nhapb
    call input
    mov cx, x
    
    add bx,cx
    mov x, bx
    
    cout ketqua
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
        sub al, '0'
        xor ah, ah
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
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop print
    ret
        
        
    
    
output endp