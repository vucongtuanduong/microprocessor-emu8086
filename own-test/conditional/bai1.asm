.model small
.stack 100h

.data
    ; Variables
    prompt_msg db 'Enter a positive number (x): $'
    result_msg db 'Result: $'
    newline db 13, 10, '$'
    x dw ?
    result dw ?

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt user to input a positive number
    mov ah, 9
    lea dx, prompt_msg
    int 21h

    ; Read the input
    mov ah, 1
    int 21h
    sub al, 30h   ; Convert ASCII to numeric value
    mov x, ax

    ; Calculate the function: 4x^3 - 3x^2 - 2x + 1
    mov ax, x
    mul ax        ; x * x
    mov bx, ax
    mul ax        ; x^2 * x = x^3
    mov cx, bx
    ;mov ax, bx    ; ax = x^2
    mov dx, 4
    imul dx       ; 4 * x^3
    mov bx, ax
    mov ax, cx    ; ax = x^3
    mov dx, 3
    imul dx       ; 3 * x^2
    sub bx, ax    ; 4x^3 - 3x^2
    mov ax, x
    mov dx, 2
    imul dx       ; 2 * x
    sub bx, ax    ; 4x^3 - 3x^2 - 2x
    add bx, 1     ; 4x^3 - 3x^2 - 2x + 1
    mov result, bx

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
