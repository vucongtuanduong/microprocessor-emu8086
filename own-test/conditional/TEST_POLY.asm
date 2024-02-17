.model small
.stack 100h

.data
    ; Variables
    prompt_msg db 'Enter the value of x: $'
    result_msg db 'Result: $'
    newline db 13, 10, '$'
    x dw ?
    result dw ?

    ; Pre-known numbers
    a dw 1
    b dw 4
    c dw 1
    d dw 2

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt user to input a value for x
    mov ah, 9
    lea dx, prompt_msg
    int 21h

    ; Read the input
    mov ah, 1
    int 21h
    sub al, 30h   ; Convert ASCII to numeric value
    mov x, ax

    ; Calculate the function: f = (ax + b) / (cx - d)
    mov ax, x     ; AX = x
    mov bx, a     ; BX = a
    mul bx        ; AX * BX (ax)
    add ax, b     ; AX + b (ax + b)

    mov bx, x     ; BX = x
    mov dx, c     ; DX = c
    add dx, d     ; DX - d (cx + d)

    cwd           ; Convert AX to signed DX:AX
    idiv dx       ; (ax + b) / (cx - d)

    mov result, ax ; Store the result

    ; Display result
    ; Newline
    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 9
    lea dx, result_msg
    int 21h

    mov ax, result
    add ax, 30h   ; Convert result to ASCII
    mov dl, al
    mov ah, 2
    int 21h

    ; Newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp

end main
