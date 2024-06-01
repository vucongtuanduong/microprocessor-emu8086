.model small
.stack 100h
.data
    nhapvao db 'Moi ban nhap vao mot chuoi ki tu: $'
    inthuong db 13, 10,  'Chuoi ki tu in thuong : $' 
    inhoa db 13, 10, 'Chuoi ki tu in hoa: $'
    input db 100 dup('$')
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
    
    cout inthuong
    
    mov ch, 0
    mov cl, input + 1
    lea si, input + 2
    mov ah, 2
    call lowercase
    
    cout inhoa
    
    mov ch, 0
    mov cl, input + 1
    lea si, input + 2
    mov ah, 2
    call uppercase
    
    
   
    
    mov ah, 4ch
    int 21h
    
main endp

lowercase proc    
    loop_lower:
        mov dl, [si]
        cmp dl, 'A'
        jl print_lower
        cmp dl, 'Z'
        jg print_lower
        add dl, 32
    
    print_lower:
        int 21h
        inc si
        loop loop_lower
    ret

lowercase endp

uppercase proc
    loop_upper:
        mov dl, [si]
        cmp dl, 'a'
        jl print_upper
        cmp dl, 'z'
        jg print_upper
        sub dl, 32
        
    print_upper:
        int 21h        
        inc si
        loop loop_upper 
        
    ret
    
uppercase endp
