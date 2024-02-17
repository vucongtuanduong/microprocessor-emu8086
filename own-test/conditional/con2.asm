include "emu8086.inc"

org    100h

MOV AX, -3

CMP AX, 0
JNS DG     ; jump if not signed
MOV CL, 1
JMP RA
   
DG:
    MOV CL, 0
RA:
    ret   
