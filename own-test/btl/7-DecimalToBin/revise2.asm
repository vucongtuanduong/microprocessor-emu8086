.model small
.stack 100h
.data
    base_10 dw 10  
    base_2 dw 2    
    n dw 0
    endl db 13, 10, '$'

.code

    main proc
       mov ax, @data
       mov ds, ax
       
       call input
       
       mov ah, 9
       lea dx, endl
       int 21h  
       
       mov ax, n
       call output   
       
       mov ah, 4ch
       int 21h
       
        
    
    
    main endp
    
input proc  
    loop_input:
        mov ah, 1
        int 21h
        cmp al, 13  
        je end_input 
        sub al, '0'    
        xor ah, ah
        push ax
        mov ax, n
        mul base_10
           
        mov n, ax
        pop ax
        add n, ax
        jmp loop_input

    
    end_input:
        ret
        

input endp 

output proc 
    mov cx, 0
    loop_output:
        mov dx, 0
        div base_2 
        push dx
        inc cx
        cmp ax, 0
        jg loop_output
        
        mov ah, 2
        
    print:
        pop dx
        add dl, '0'
        int 21h
        loop print
        
    ret
    

output endp   

END MAIN
    