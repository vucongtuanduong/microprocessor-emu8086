;ctrin cho phep nhap mot chuoi cac ky tu, viec nhap ket thuc khi nhan '#'
.Model Small
.Stack 100H
.Data
    endl DB 10, 13, 'Ket qua la: ', 10, 13, '$'
    str DB 20 DUP ('$')  
    ketthuc DB '#$'
.Code
MAIN PROC
    
    MOV AX, @Data
    MOV DS, AX
    
    Nhap:
        MOV AH, 1
        INT 21H
        
        CMP AL, ketthuc
        JE KetThucNhap:   
        
        CMP AL, ketthuc
        JNE Nhap
    KetThucNhap:
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
end
        