.model small
.stack 100h
.data
    nhapvao db 'Moi ban nhap vao mot ki tu in thuong: $'
    inra db 13, 10,  'Ki tu in hoa : $'
    input db 0
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
    
    mov ah, 1
    int 21h
    sub al, 32 
    mov input, al
    
    cout inra
    
    mov ah, 2
    mov dl, input
    int 21h
    
    mov ah, 4ch
    int 21h
    
main endp
