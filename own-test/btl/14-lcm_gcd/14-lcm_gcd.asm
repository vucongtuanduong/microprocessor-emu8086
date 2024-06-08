.model small
.stack 100h
.data    
    endl db 13, 10, '$'
    x dw 0
    a dw 0
    b dw 0
    
    gcd dw 0
    lcm dw 0
    
    nhapa db 13, 10, 'Nhap so a : $'
    nhapb db 13, 10, 'Nhap so b: $'
    ketqualcm db 13, 10, 'LCM(a, b) = $'
    ketquagcd db 13, 10, 'GCD(a, b) = $'
    
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
    
    mov ax, x  
    mov a, ax
    
    cout nhapb
    call input
    mov ax, x
    mov b, ax 
    
    
    cout ketquagcd
    call gcdEuclid 
    
    mov gcd, ax
    mov x, ax
    call output
    
    cout ketqualcm
    
    mov ax, a
    mov bx, gcd
    xor dx, dx
    div bx
    
    mov bx, b
    mul bx
    
    mov x, ax
    call output           
    
    mov ah, 4ch
    int 21h
    
main endp 

gcdEuclid proc     
    mov ax, a
    mov dx, b
    euclid:  
        cmp dx, 0
        je return_gcd
        mov bx, dx
        xor dx, dx
        div bx
        mov ax, bx
        jmp euclid
    return_gcd:
        ret
    
        
    
gcdEuclid endp

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