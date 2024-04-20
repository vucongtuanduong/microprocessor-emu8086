Here is the full text converted into Markdown format:

```markdown
# Assembly Code: Converting Lowercase Letters to Uppercase

This code reads a string from the user, converts any lowercase letters to uppercase, and then prints the modified string to the console.

## Data Segment:

```assembly
.Model Small
.Stack 100H
.Data
    endl DB 10,13,'Ket qua la', 10, 13, '$'
    str DB 20 DUP ('$')
```

- `.Model Small`: Sets the memory model to small, meaning there's one code segment and one data segment.
- `.Stack 100H`: Reserves 100h bytes of memory for the stack.
- `.Data`: Starts the data segment.
- `endl DB ...`: Defines a string "Ket qua la" with line breaks for output formatting.
- `str DB ...`: Defines a 20-byte string to store user input, initially filled with '$'.

## Code Segment:

```assembly
.Code
MAIN Proc
    MOV AX, @Data 
    MOV DS, AX
    ;MOV ES, AX
      
    MOV AH, 10
    LEA DX, str
    INT 21H
    
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    LEA SI, str + 2
    
InHoa:
    MOV DL, [SI]
    CMP DL, 'a'
    JL InRa
    CMP DL, 'z'
    JG InRa
        
    SUB DL, 32
InRa:
    MOV AH, 2
    INT 21H
        
    INC SI
    CMP [SI], '$'
    JNE InHoa
    MOV AH, 4CH
    INT 21H                       
MAIN Endp
END MAIN
```

- `MOV AX, @Data`: Loads the data segment address into AX.
- `MOV DS, AX`: Sets the data segment register (DS) to the value in AX for data access.
- `;MOV ES, AX`: This line is commented out and has no effect. It seems like it was intended to set the extra segment register (ES) but is not necessary in this code.
- `MOV AH, 10`: Sets function to read a string with echo.
- `LEA DX, str`: Provides address to store input in str.
- `INT 21H`: Calls DOS system interrupt to read input.
- `MOV AH, 9`: Sets function to print a string.
- `LEA DX, endl`: Provides address of "Ket qua la" string.
- `INT 21H`: Prints the string.
- `LEA SI, str + 2`: Points SI to the third character of input (skipping length bytes).
- `MOV DL, [SI]`: Loads the character pointed to by SI into DL.
- `CMP DL, 'a'`: Compares the character with 'a'.
- `JL InRa`: Jumps to InRa if the character is less than 'a' (not lowercase).
- `CMP DL, 'z'`: Compares the character with 'z'.
- `JG InRa`: Jumps to InRa if the character is greater than 'z' (not lowercase).
- `SUB DL, 32`: If the character is lowercase, subtract 32 from its ASCII value to convert it to uppercase.
- `MOV AH, 2`: Sets function to print a character.
- `INT 21H`: Prints the character in DL.
- `INC SI`: Moves to the next character in the string.
- `CMP [SI], '$'`: Checks for the end of the string ('$').
- `JNE InHoa`: Jumps back to InHoa if the end of the string is not reached.
- `MOV AH, 4CH`: Sets function to terminate the program.
- `INT 21H`: Exits the program.
- `MAIN Endp`: Marks the end of the MAIN procedure.
- `END MAIN`: Indicates the end of the source code and that MAIN is the starting point.
```