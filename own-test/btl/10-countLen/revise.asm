.model small
.stack 100h
.data
    nhapvao db 'Moi ban nhap vao mot ki tu in thuong: $'
    inra db 13, 10,  'Do dai chuoi ki tu : $'
    input db 100 dup('$')    
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
    
    cout nhapvao
    
    mov ah, 10
    lea dx, input
    int 21h
    
    
    mov ax, 0
    mov al, input + 1
    mov x, ax  
    cout inra
    call output
    
    
    mov ah, 4ch
    int 21h
    
main endp

output proc
    mov ax, x
    mov cx, 0
    
    divide:
        xor dx, dx
        div base_10
        push dx
        inc cx
        cmp al, 0
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
