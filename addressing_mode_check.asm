;The instruction format contains 3 bits of opcode, 12 bits for address and 1 bit for
;addressing mode. There are only two addressing modes, I = 0 is direct addressing and I =
;1 is indirect addressing. Write an assembly program to check the I bit to determine the
;addressing mode and then jump accordingly.

; This program checks the I bit in the instruction and jumps accordingly
; I = 0: Direct Addressing
; I = 1: Indirect Addressing

START:
    ; Initialize Program Counter (PC) and Address Register (AR)
    LDA INSTRUCTION     ; Load instruction from memory (assuming instruction is stored at address 000)
    STA IR              ; Store it in the Instruction Register (IR)
    
    ; Extract the I bit (bit 14) and address part (bits 0-12)
    ANDI 8000           ; Mask the I bit (Bit 14) from instruction (I bit is the most significant bit of instruction)
    BEQ DIRECT_ADDRESS   ; If I = 0 (I bit is 0), jump to DIRECT_ADDRESS
    JMP INDIRECT_ADDRESS ; If I = 1 (I bit is 1), jump to INDIRECT_ADDRESS

; Direct Addressing (I = 0):
DIRECT_ADDRESS:
    LDA IR              ; Load the instruction again into IR
    ANDI 0FFF           ; Mask the address (bits 0-12) from the instruction
    STA AR              ; Store the address part in AR (Address Register)
    LDA AR              ; Load the address into the accumulator
    ADD 000             ; Add the value from the memory address (direct addressing)
    STA AC_REG          ; Store the result in AC_REG (Accumulator Register)
    HALT                ; End the program

; Indirect Addressing (I = 1):
INDIRECT_ADDRESS:
    LDA IR              ; Load the instruction again into IR
    ANDI 0FFF           ; Mask the address (bits 0-12) from the instruction
    STA AR              ; Store the address part in AR (Address Register)
    LDA AR              ; Load the address in AR into the accumulator
    ADD MEMORY          ; Add the value from the indirect address (indirect addressing)
    STA AC_REG          ; Store the result in AC_REG (Accumulator Register)
    HALT                ; End the program

; Data section
INSTRUCTION  DATA 8010    ; Example instruction (I = 1, address = 010)
AC_REG       DATA 0       ; Accumulator register
IR           DATA 0       ; Instruction register
AR           DATA 0       ; Address register
MEMORY       DATA 100     ; Memory at address 100 contains value 100 (indirect address points here)
