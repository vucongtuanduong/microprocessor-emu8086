.model small
.stack 100h
.data    
    endl db 13, 10, '$'
    x dw 0   
    temp dw 0
    sum dw 0
    num dw 0
    length dw 0
    nhapvao db 13, 10, 'Nhap do dai mang: $'
    ketquatong db 13, 10, 'Tong cac so chia het cho 11 trong mang: $'
    ketquaso db 13, 10, 'So cac so chia het cho 11: $' 
    
    base_11 dw 11
    
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
               
    cout nhapvao
    call input
    mov cx, x
    cout endl
    input_array:
        call input
        

        
        mov ax, x 
        mov temp, ax
        xor dh, dh
        mov dl, 11
        div dl
        cmp ah, 0
        jne continue
        inc num   
        mov ax, sum
        add ax, temp
        mov sum, ax
       
     continue:
        loop input_array
     
     cout ketquatong
     call output
     
     cout ketquaso
     mov ax, num
     mov sum, ax
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
    mov ax, sum
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