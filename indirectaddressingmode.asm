;Simulate the machine for the memory-reference instruction referred in above question
;with I= 1 (Indirect Address) and address part = 082. The instruction to be stored at
;address 026 in RAM. Initialize the memory word at address 082 with the value 298.
;Initialize the memory word at address 298 with operand 632 and AC with 937. Determine
;the contents of AC, DR, PC, AR and IR in decimal after the execution. 

; Assembly program to simulate the machine with I = 1 (indirect addressing mode)
; and instruction at address 026. The operand is at memory address 298.
; Initial values:
; AC = 937, Memory[082] = 298, Memory[298] = 632

START:
    LDA 000            ; Initialize AC to 0 (clear the accumulator)
    STA AC_REG         ; Store the value of AC in AC_REG

    LDA 026            ; Load the instruction stored at address 026 (ADD with indirect addressing)
    STA IR_REG         ; Store the instruction in the IR (Instruction Register)

    LDA 082            ; Load the value at address 082, which is the address of the operand (298)
    STA AR_REG         ; Store 082 in the AR (Address Register)

    LDA AR_REG         ; Load the value in AR (which is 298)
    STA AR_REG         ; Store it in AR (keeping it for address lookup)

    LDA AR_REG         ; Load the operand address (298)
    ADD 298            ; Add the value at address 298 to AC (the operand is stored at address 298)
    STA AC_REG         ; Store the result back in AC_REG

    ; Output and halt the program
    LDA AC_REG         ; Load the final result into AC
    OUT                ; Output the sum
    HALT               ; End the program

; Data section
AC_REG    DATA 937      ; Accumulator register initialized to 937
IR_REG    DATA 0        ; Instruction Register
AR_REG    DATA 0        ; Address Register
PC_REG    DATA 026      ; Program Counter set to the starting instruction address
MEMORY    DATA 298      ; Operand address stored at address 082
MEMORY_298 DATA 632    ; Operand value at address 298
