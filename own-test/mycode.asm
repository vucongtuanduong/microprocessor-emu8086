.MODEL SMALL
.STACK 100h

.DATA
oceanSize DW 31 ; Kích thu?c vùng bi?n (s? ph?n t? m?ng)
tresureLocation DW 88 ; V? trí kho báu (b)
playerGuess DW 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ; Ph?n t? 1-10 c?a m?ng
        DW 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ; Ph?n t? 11-20
        DW 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 ; Ph?n t? 21-31
msg DB 'Xin chuc mung!$' ; Chu?i thông báo

.CODE
MAIN PROC
    MOV AX, @DATA ; Kh?i t?o segment data
    MOV DS, AX

    ; Kh?i t?o searchDepth = 0
    MOV CX, 0

vonglap:
    CMP CX, oceanSize ; So sánh searchDepth v?i oceanSize
    JG ketthuc ; Nh?y t?i k?t thúc n?u searchDepth > oceanSize

    ; L?y giá tr? d? doán t? m?ng playerGuess
    MOV SI, OFFSET playerGuess ; Ð?a ch? b?t d?u c?a m?ng
    ADD SI, CX ; D?ch chuy?n d?n ph?n t? th? CX
    MOV DX, [SI] ; L?y giá tr? t? m?ng

    CMP DX, tresureLocation ; So sánh giá tr? d? doán v?i treasureLocation
    JE timthay ; Nh?y t?i timthay n?u d? doán chính xác

    INC CX ; Tang searchDepth
    JMP vonglap ; Quay l?i vòng l?p

timthay:
    ; In thông báo "Xin chúc m?ng!"
    MOV AH, 09h ; Hàm in chu?i
    LEA DX, msg 
    INT 21h
    JMP ketthuc ; Nh?y t?i k?t thúc

ketthuc:
    ; K?t thúc chuong trình
    MOV AH, 4Ch
    INT 21h

MAIN ENDP

END MAIN