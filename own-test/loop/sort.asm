.Model Small
.Stack 100H
.Data
    LIST_COUNT EQU 10
    list DB 1,4,0,3,7,2,8
    CRLF DB 13,10,'$'
.Code
MAIN PROC:
    MOV AX, @Data
    MOV DS, AX
    
    MOV CX, LIST_COUNT
    LEA SI, list
    CALL printList
    LEA SI, list
    MOV BL, 1; bien dem luu vao     
    
MainLoop:
    MOV AL, [SI] ; al <-- [si]
    MOV DI, SI
    MOV BH, BL; bien dem phu
    MOV DX, DI ;DX luu vi tri cua gia tri min
SubLoop:
    INC DI
    INC BH
    CMP , [DI]
    JLE NotMin
    MOV AL, [DI]
    MOV DX, DI
NotMin:
    CMP BH, LIST_COUNT
    JE ExitSub
    JMP SubLoop
ExitSub:
    ;hoan doi vi tri min khac voi vi tri dau tien
    MOV DI, DX
    CMP SI, DI
    JE NoSwap
    CALL swapMemLocation
NoSwap:
    INC BL
    CMP BL, LIST_COUNT
    