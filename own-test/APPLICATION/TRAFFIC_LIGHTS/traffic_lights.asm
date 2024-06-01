.Model Small
.Stack 100H
.Data
    ;3 - 4
    ;2 - 1
    ; 0000 gyr gyr gyr gyr
    R1 DW 0000 001 100 001 100B; DI DOC
    R2 DW 0000 001 010 001 010B; DOC -> VANG
    R3 DW 0000 100 001 100 001B; DI NGANG
    R4 DW 0000 010 001 010 001B;
    
    
    ALL_RED EQU 0000 001 001 001 001B;
    PORT EQU 4
    
    ;HANG SO THOI GIAN
    WAIT_5_SEC_CX EQU  4CH;
    WAIT_5_SEC_DX EQU 4B40H
    
    
    WAIT_15_SEC_CX EQU 0E4H;
    WAIT_15_SEC_DX EQU 0E1C0H;
.Code
    waitMacro MACRO t1, t2
        MOV CX, t1
        MOV DX, t2
        MOV AH, 86H
        INT 15H
    ENDM
    
    DISPLAY_MACRO MACRO t1, t2, r
        LEA SI, r
        MOV AX, [SI]
        OUT PORT, AX
        waitMacro t1, t2
    ENDM

MAIN PROC
    
    MOV AX, @Data
    MOV DS, AX
    MOV AX, ALL_RED
    OUT PORT, AX
   
    waitMacro WAIT_5_SEC_CX, WAIT_5_SEC_DX
    
    Start:
        DISPLAY_MACRO WAIT_10_SEC_CX, WAIT_10_SEC_DX, R1
        DISPLAY_MACRO WAIT_5_SEC_CX, WAIT_10_SEC_DX, R2
        DISPLAY_MACRO WAIT_10_SEC_CX, WAIT_10_SEC_DX, R3
        DISPLAY_MACRO WAIT_5_SEC_CX, WAIT_10_SEC_DX, R4
        JMP Start
    
    MOV AH, 4CH
    INT 21H
       
            
        
    MAIN ENDP
    