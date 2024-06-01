.model small
.stack 100h
.data
    endl db 13, 10, '$'
    nhapvao db 13, 10, 'Moi ban nhap 1 ki tu: $'
    inra db 13, 10, 'Ki tu ban nhap la : $'       
    n db 0
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
    mov n, al 
    
    cout inra
    
    mov ah, 2
    mov dl, n
    int 21h
    
    
main endp