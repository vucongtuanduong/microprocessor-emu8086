.model small
.stack 100h
.data    
    endl db 13, 10, '$'
    x dw 0   
    input_string db 100 dup('$')
    count dw 0
    ketqua db 13, 10, 'So lan xuat hien cua ktmt trong xau: $'
    last dw 0
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
               
    mov ah, 10
    lea dx, input_string
    int 21h
    
    cout endl 
    
    mov al, input_string + 1
    sub al, 4
    xor ah, ah
    
    mov last, ax
    lea si, input_string+ 2
    lea di, input_string
    
    xor dx, dx
    xor cx,cx
    
    lap:
        cmp [si], '$'
        je done
        cmp [si], 'k'
        jne continue
        cmp [si + 1], 't'
        jne continue   
        cmp [si + 2], 'm'
        jne continue
        cmp [si + 3], 't'
        jne continue
        cmp [si + 3], '$'
        je done
        inc dx
    
    continue:
        inc si
        inc cx
        jmp lap
        
    done:
        mov count, dx
        cout  ketqua
        
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
    mov ax, count
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