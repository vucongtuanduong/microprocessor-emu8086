Here is the full text converted into Markdown format:

```markdown
# Assembly Code: Calculating and Printing Factorial

This assembly code calculates the factorial of a given number (150 in this case) and then prints the result to the console.

## Data Segment:

```assembly
.Model Small
.Stack 100
.Data
    endl DB 10,13, 'Ket qua la', 10, 13, '$'
    str DB 'KTMT_2024$'
```

- `.Model Small`: Sets the memory model to small (one code and one data segment).
- `.Stack 100`: Reserves 100 bytes of memory for the stack.
- `.Data`: Starts the data segment.
- `endl DB ...`: Defines a string "Ket qua la" with line breaks for output formatting.
- `str DB ...`: Defines a string "KTMT_2024$" (not used in the calculation).

## Code Segment:

```assembly
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV SI, 150
    XOR BX, BX
    Lap:
        ADD BX, SI
        DEC SI
        CMP SI, 0
        JNE Lap
    MOV AH, 9
    LEA DX, endl
    INT 21H
    
    MOV AX, BX
    MOV BX, 10
    XOR SI, SI
    Lap1:
       XOR DX, DX
       DIV BX
       PUSH DX
       INC SI
       
       CMP AX, 0
       JNE Lap1
       
    Lap2:
        POP DX
        ADD DX, '0'
        MOV AH, 2
        INT 21H
        
        DEC SI
        CMP SI, 0
        JNE Lap2
    MOV AH, 4CH
    INT 21H
    
    MAIN Endp
END
```

- `MOV AX, @Data`: Loads the data segment address into AX.
- `MOV DS, AX`: Sets the data segment register (DS) for data access.
- `MOV SI, 150`: Initializes SI with the number 150 (the number for which to calculate the factorial).
- `XOR BX, BX`: Clears the BX register, effectively setting it to 0. This will be used to accumulate the product.
- `ADD BX, SI`: Adds the value in SI to the accumulator in BX.
- `DEC SI`: Decrements the value in SI by 1.
- `CMP SI, 0`: Compares SI with 0.
- `JNE Lap`: If SI is not equal to 0, jump back to the Lap label to continue the loop.
- `MOV AH, 9`: Sets function to print a string.
- `LEA DX, endl`: Provides the address of the "Ket qua la" string.
- `INT 21H`: Prints the string.
- `MOV AX, BX`: Moves the factorial result from BX to AX for processing.
- `MOV BX, 10`: Sets BX to 10, the base for decimal conversion.
- `XOR SI, SI`: Clears SI, which will be used as a counter for the number of digits.
- `XOR DX, DX`: Clears the DX register.
- `DIV BX`: Divides AX by BX (10). The quotient is stored in AX, and the remainder is stored in DX. The remainder represents a decimal digit.
- `PUSH DX`: Pushes the remainder (digit) onto the stack for later printing.
- `INC SI`: Increments the digit counter.
- `CMP AX, 0`: Checks if the quotient in AX is zero.
- `JNE Lap1`: If the quotient is not zero, jump back to Lap1 to continue the division process.
- `POP DX`: Pops a digit from the stack into DX.
- `ADD DX, '0'`: Converts the digit to its ASCII character representation by adding the ASCII value of '0'.
- `MOV AH, 2`: Sets function to print a character.
- `INT 21H`: Prints the character in DL.
- `DEC SI`: Decrements the digit counter.
- `CMP SI, 0`: Checks if all digits have been printed.
- `JNE Lap2`: If there are more digits, jump back to Lap2 to print the next digit.
- `MOV AH, 4CH`: Sets function to terminate the program.
- `INT 21H`: Exits the program.
- `MAIN Endp`: Marks the end of the MAIN procedure.
- `END`: Indicates the end of the source code.

## Summary:

- Initialization: Sets up data segment and initial values.
- Factorial Calculation: Calculates the factorial of 150 using a loop.
- Introduction Print: Prints "Ket qua la" to the console.
- Decimal Conversion: Converts the factorial result into individual decimal digits and stores them on the stack.
- Digit Printing: Prints each digit from the stack in reverse order to form the final result.
- Termination: Ends the program.
```