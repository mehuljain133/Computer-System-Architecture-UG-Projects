;Create a machine for the following instruction format:
;Instruction format
;15 14 13 12 11 0
;OP code I Address
;The instruction format contains a 3-bit opcode, a 1-bit addressing mode and a 12-bit address.
;Write an assembly program to simulate the machine for addition of two numbers with I= 0
;(Direct Address) and address part = 082. The instruction to be stored at address 022 in RAM,
;initialize the memory word with any decimal value at address 082. Determine the contents of
;AC, DR, PC, AR and IR in decimal after the execution.

; Assembly program to simulate the machine with the given instruction format
; This program simulates adding two numbers in memory (direct addressing mode)

START:
    LDA 000                ; Initialize AC to 0 (clear the accumulator)
    STA AC_REG             ; Store the value of AC in AC_REG

    LDA 022                ; Load the instruction stored at address 022 (which is ADD)
    STA IR_REG             ; Store the instruction in the IR (Instruction Register)
    
    LDA 082                ; Load the operand at address 082 into AC (Operand to add)
    STA DR_REG             ; Store the operand in the DR (Data Register)

    LDA AC_REG             ; Load the value of AC (which is 0)
    ADD DR_REG             ; Add the operand (DR) to AC
    STA AC_REG             ; Store the result back in AC_REG
    
    LDA AC_REG             ; Load the final sum into AC
    OUT                    ; Output the sum (this is optional, but it shows the result)
    
    ; Output and halt the program
    HALT                   ; End the program

; Data section
AC_REG    DATA 0          ; Accumulator register initialized to 0
DR_REG    DATA 0          ; Data Register for storing operand
IR_REG    DATA 0          ; Instruction Register
PC_REG    DATA 022        ; Program Counter set to the starting instruction address
MEMORY   DATA 5           ; Operand stored at address 082 (memory at 082 initialized to 5)
