.Model Small
.Stack 100H
.Data
    list DB 1,4,0,8,7,2,4,6,2,5
.Code
MAIN Proc
    MOV AX, @Data
    MOV DS, AX
    
    CLD
    MOV CX, 9
    LEA SI, list ;SI tro den list
    MOV BL, [SI] ; gan Max <- phan tu dau tien
    INC SI
START:
    LODSB
    CMP AL, BL
    JLE BYPASS
    MOV BL, AL; Neu AL > BL -> BL se duoc cap nhat gia tri
BYPASS:
    LOOP START
    ;in ra gia tri lon nhat
    ADD BL, '0'; bien doi so thanh ki tu
    MOV DL, BL
    MOV AH, 2
    INT 21H
    
    ;ket thuc chuong trinh dung ham 4ch
    MOV AH, 4CH
    INT 21H
MAIN Endp
    END MAIN