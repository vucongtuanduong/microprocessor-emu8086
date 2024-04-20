.MODEL SMALL
.STACK 100h

.DATA
oceanSize DW 31 ; K�ch thu?c v�ng bi?n (s? ph?n t? m?ng)
tresureLocation DW 88 ; V? tr� kho b�u (b)
playerGuess DW 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ; Ph?n t? 1-10 c?a m?ng
        DW 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ; Ph?n t? 11-20
        DW 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 ; Ph?n t? 21-31
msg DB 'Xin chuc mung!$' ; Chu?i th�ng b�o

.CODE
MAIN PROC
    MOV AX, @DATA ; Kh?i t?o segment data
    MOV DS, AX

    ; Kh?i t?o searchDepth = 0
    MOV CX, 0

vonglap:
    CMP CX, oceanSize ; So s�nh searchDepth v?i oceanSize
    JG ketthuc ; Nh?y t?i k?t th�c n?u searchDepth > oceanSize

    ; L?y gi� tr? d? do�n t? m?ng playerGuess
    MOV SI, OFFSET playerGuess ; �?a ch? b?t d?u c?a m?ng
    ADD SI, CX ; D?ch chuy?n d?n ph?n t? th? CX
    MOV DX, [SI] ; L?y gi� tr? t? m?ng

    CMP DX, tresureLocation ; So s�nh gi� tr? d? do�n v?i treasureLocation
    JE timthay ; Nh?y t?i timthay n?u d? do�n ch�nh x�c

    INC CX ; Tang searchDepth
    JMP vonglap ; Quay l?i v�ng l?p

timthay:
    ; In th�ng b�o "Xin ch�c m?ng!"
    MOV AH, 09h ; H�m in chu?i
    LEA DX, msg 
    INT 21h
    JMP ketthuc ; Nh?y t?i k?t th�c

ketthuc:
    ; K?t th�c chuong tr�nh
    MOV AH, 4Ch
    INT 21h

MAIN ENDP

END MAIN