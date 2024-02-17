include "emu8086.inc"

org    100h

MOV AX, -3

CMP AX, 0 
JL AM
JE KHONG
JG DUONG

AM:
    MOV CX, -1
    JMP RA
DUONG:
    MOV CX, 1
    JMP RA
KHONG:
    MOV CX, 0

RA:
    ret   
