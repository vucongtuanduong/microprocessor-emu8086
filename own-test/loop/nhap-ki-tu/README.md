Sure, here's the full text converted into Markdown format:

```markdown
## Assembly Code: Reading Input Until '#'

This code continuously reads characters from the user until the '#' character is entered.

### Data Segment:

```assembly
.Model Small
.Stack 100H
.Data
    endl DB 10, 13, 'Ket qua la: ', 10, 13, '$'
    str DB 20 DUP ('$')  
    ketthuc DB '#$'
```

- `.Model Small`: Sets the memory model to small, indicating one code segment and one data segment.
- `.Stack 100H`: Reserves 100h bytes of memory for the stack.
- `.Data`: Starts the data segment.
- `endl DB ...`: Defines a string "Ket qua la: " with line breaks for potential output formatting (not used in this code snippet).
- `str DB ...`: Defines a 20-byte string to store user input, initially filled with '$' (not used in this code snippet).
- `ketthuc DB '#$'`: Defines a string containing '#' and the string terminator '$', used for comparison to end input.

### Code Segment:

```assembly
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
```

- `MOV AX, @Data`: Loads the segment address of the data segment into the AX register.
- `MOV DS, AX`: Sets the data segment register (DS) to the value in AX, allowing the program to access the data in the ketthuc string.
- `MOV AH, 1`: Sets AH to 1, indicating the function to read a character from the keyboard without echo.
- `INT 21H`: Calls interrupt 21h, which executes the DOS system call to read a character from the user and store it in the AL register.
- `CMP AL, ketthuc`: Compares the character in AL with the string ketthuc ("#$").
- `JE KetThucNhap`: If the comparison is equal (the character is '#'), jump to the label KetThucNhap to end the input loop.
- `CMP AL, ketthuc`: This line is redundant and has the same effect as the previous comparison.
- `JNE Nhap`: If the character is not '#', jump back to the label Nhap to continue reading input.
- `MOV AH, 4CH`: Sets AH to 4Ch, indicating the function to terminate the program.
- `INT 21H`: Calls interrupt 21h to end the program.
- `MAIN ENDP`: Marks the end of the MAIN procedure.
- `end`: Indicates the end of the source code file.

### Summary:

- **Initialization**: Sets up the data segment and prepares for input.
- **Input Loop**: Continuously reads characters from the user until '#' is encountered.
- **Termination**: Ends the program when '#' is entered.
```