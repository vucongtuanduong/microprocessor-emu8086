; this short program for emu8086 shows how to keep constant temperature
; using heater and thermometer (between 60° to 80°),
; it is assumed that air temperature is lower 60°.

; thermometer.exe is started automatically from c:\emu8086\devices.
; it is also accessible from the "virtual devices" menu of the emulator.

#start=thermometer.exe#

; temperature rises fast, thus emulator should be set to run at the maximum speed.

; if closed, the thermometer window can be re-opened from emulator's "virtual devices" menu.



#make_bin#
in_port EQU 100h;
out_port equ 105h;
name "thermo"

; set data segment to code segment:
mov ax, cs
mov ds, ax

start:
mov dx, in_port
in al, dx

cmp al, 70
jl  low

cmp al, 100
jle  ok
jg   high

low:
mov al, 1 
mov dx, out_port
out dx, al   ; turn heater "on".
jmp ok

high: 
mov dx, out_port
mov al, 0
out dx, al   ; turn heater "off". 

ok:
jmp start   ; endless loop.