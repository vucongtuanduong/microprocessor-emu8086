.Model Small
.Stack 100H
.Data
    ; Khai bao cac bien va hang
    CRLF DB 13,10,'$' ;Ky tu xuong ong
    MSG1 DB 'Hello World!$'
    MSG2 DB 'My name is Duong$'
.Code
MAIN Proc
    ;Khoi tao cho thanh ghi DS
    MOV AX, @Data
    MOV DS, AX ; nap dia chi doan du lieu vao DS
    ;In gia tri xuong dong
    MOV AH, 9
    LEA DX, MSG1 ; Nap dia chi cua MSG1 vao DX
    INT 21H ; Hien thong diep
    ; In ky tu xuong dong
    MOV AH, 9
    LEA DX, CRLF ; Nap dia chi cua CRLF vao DX
    INT 21H ; Hien thong diep
    ; Hien loi chao dung ham 9 cua ngat 21H
    MOV AH, 9
    LEA DX, MSG2 ; Nap dia chi cua MSG2 vao DX
    INT 21H ; Hien thong diep
    ; Ket thuc tro ve chuong trinh goi
    MOV AH, 4CH ; Dung ham 4CH cua ngat 21H
    INT 21H ; Ket thuc chuong trinh
MAIN Endp
