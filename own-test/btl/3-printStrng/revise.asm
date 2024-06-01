.model small
.stack 100h
.data
    input db 100 dup('$') 
    endl db 13, 10, '$'
    
.code
main proc
    
    mov ax, @data
    mov ds, ax
    mov ah, 10
    lea dx, input
    int 21h
           
    mov ah, 9
    lea dx, endl
    int 21h
    
    mov ah, 9
    lea dx, input + 2
    int 21h
    
    mov ah, 4ch
    int 21h
endp
    