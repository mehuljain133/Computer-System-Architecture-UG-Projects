;Write an assembly program for simulating following memory-reference instructions.

; PhD-level simulation of memory-reference instructions
; The program will simulate LDA, STA, ADD, SUB, BUN, and ISZ

START:
    ; Initialize some values in memory
    PRINT "Initializing memory values and starting simulation..."
    
    ; Initialize memory locations
    LDA NUM1                 ; Load NUM1 into Accumulator
    STA MEM_LOC1             ; Store NUM1 in MEM_LOC1
    LDA NUM2                 ; Load NUM2 into Accumulator
    STA MEM_LOC2             ; Store NUM2 in MEM_LOC2

    ; -------------------------------
    ; Simulate ADD operation
    ; -------------------------------
    PRINT "Performing ADD operation..."
    LDA MEM_LOC1             ; Load MEM_LOC1 into Accumulator (AC)
    ADD MEM_LOC2             ; Add MEM_LOC2 to AC (AC = MEM_LOC1 + MEM_LOC2)
    STA ADD_RESULT           ; Store the result in ADD_RESULT
    PRINT "ADD operation result: "
    OUTPUT ADD_RESULT        ; Output the result of ADD

    ; -------------------------------
    ; Simulate SUB operation
    ; -------------------------------
    PRINT "Performing SUB operation..."
    LDA MEM_LOC1             ; Load MEM_LOC1 into AC
    SUB MEM_LOC2             ; Subtract MEM_LOC2 from AC (AC = MEM_LOC1 - MEM_LOC2)
    STA SUB_RESULT           ; Store the result in SUB_RESULT
    PRINT "SUB operation result: "
    OUTPUT SUB_RESULT        ; Output the result of SUB

    ; -------------------------------
    ; Simulate LDA and STA operations
    ; -------------------------------
    PRINT "Performing LDA and STA operations..."
    LDA MEM_LOC2             ; Load MEM_LOC2 into AC
    STA MEM_LOC3             ; Store the value of AC in MEM_LOC3 (MEM_LOC3 = MEM_LOC2)

    PRINT "MEM_LOC3 now contains: "
    OUTPUT MEM_LOC3          ; Output the value stored in MEM_LOC3

    ; -------------------------------
    ; Simulate BUN operation (Unconditional Branch)
    ; -------------------------------
    PRINT "Performing BUN operation..."
    BUN BRANCH_LOC           ; Branch to BRANCH_LOC (unconditional jump)
    
    ; This instruction is skipped, because the next instruction is the branch
    PRINT "This message is skipped (due to BUN)."
    
    ; -------------------------------
    ; Simulate ISZ operation (Increment and Skip if Zero)
    ; -------------------------------
    PRINT "Performing ISZ operation..."
    LDA MEM_LOC3             ; Load MEM_LOC3 into AC
    ADD ONE                  ; Add 1 to AC (AC = MEM_LOC3 + 1)
    STA MEM_LOC3             ; Store the result back into MEM_LOC3

    LDA MEM_LOC3             ; Load MEM_LOC3 into AC again
    BEQ SKIP_NEXT            ; If the result is zero, skip next instruction

    ; This instruction is executed only if MEM_LOC3 is non-zero
    PRINT "ISZ operation did not result in zero."

SKIP_NEXT:
    ; -------------------------------
    ; Simulation End
    ; -------------------------------
    PRINT "End of memory-reference instruction simulation."
    HALT

; Data Section
NUM1      DATA 10            ; Initialize NUM1 (10)
NUM2      DATA 5             ; Initialize NUM2 (5)
NUM3      DATA 0             ; Initialize NUM3 (0, will be incremented)
MEM_LOC1  DATA 0             ; Reserve space for MEM_LOC1
MEM_LOC2  DATA 0             ; Reserve space for MEM_LOC2
MEM_LOC3  DATA 0             ; Reserve space for MEM_LOC3 (used in STA and LDA operations)
ADD_RESULT DATA 0            ; Reserve space for storing ADD result
SUB_RESULT DATA 0            ; Reserve space for storing SUB result
BRANCH_LOC DATA 100          ; Reserve a branch location for BUN (100)
ZERO      DATA 0             ; Reserve space for constant zero
ONE       DATA 1             ; Reserve space for constant one

; Instructions:
; PRINT - prints a string to the screen
; INPUT - gets user input and stores it in the specified memory location
; LDA - Load a value from memory into the accumulator (AC)
; STA - Store the value in the accumulator (AC) into a memory location
; ADD - Adds the value from memory to the accumulator (AC)
; SUB - Subtract the value from memory from the accumulator (AC)
; BUN - Unconditional branch (jump to specified memory location)
; ISZ - Increment the value in memory and skip the next instruction if the result is zero
; BEQ - Branch if equal (skip next instruction if AC is zero)
; HALT - Stops program execution
; OUTPUT - print the value stored in the specified memory location
