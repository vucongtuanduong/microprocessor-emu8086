include "emu8086.inc"

org    100h

MOV CX, 10  ; dat bien dem la 10
MOV AH, 2
MOV DL, '9'
Hien: INT 21H
LOOP Hien ; sau moi luot loop, thanh ghi dem CX giam 1 
ret   
