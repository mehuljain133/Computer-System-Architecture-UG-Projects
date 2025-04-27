;Write an assembly program to simulate the following logical operations on two userentered numbers.

; PhD-level simulation of logical operations on two user-entered numbers
; This program performs AND, OR, XOR, NOT, NAND, NOR, and XNOR operations.

START:
    ; Prompt user for the first number
    PRINT "Enter the first number (8-bit value): "
    INPUT NUM1               ; User inputs first number

    ; Prompt user for the second number
    PRINT "Enter the second number (8-bit value): "
    INPUT NUM2               ; User inputs second number

    ; -----------------------------
    ; Logical AND Operation
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    AND NUM2                 ; Perform bitwise AND with NUM2
    STA AND_RESULT           ; Store the result in AND_RESULT

    ; Output AND result
    PRINT "AND operation result: "
    OUTPUT AND_RESULT        ; Output the result of AND

    ; -----------------------------
    ; Logical OR Operation
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    OR NUM2                  ; Perform bitwise OR with NUM2
    STA OR_RESULT            ; Store the result in OR_RESULT

    ; Output OR result
    PRINT "OR operation result: "
    OUTPUT OR_RESULT         ; Output the result of OR

    ; -----------------------------
    ; Logical XOR Operation
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    XOR NUM2                 ; Perform bitwise XOR with NUM2
    STA XOR_RESULT           ; Store the result in XOR_RESULT

    ; Output XOR result
    PRINT "XOR operation result: "
    OUTPUT XOR_RESULT        ; Output the result of XOR

    ; -----------------------------
    ; Logical NOT Operation (on NUM1)
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    NOT                      ; Perform bitwise NOT (invert the bits)
    STA NOT_RESULT           ; Store the result in NOT_RESULT

    ; Output NOT result (on NUM1)
    PRINT "NOT operation result (on first number): "
    OUTPUT NOT_RESULT        ; Output the result of NOT

    ; -----------------------------
    ; Logical NAND Operation (NOT of AND)
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    AND NUM2                 ; Perform AND with NUM2
    NOT                      ; Perform NOT (NAND operation)
    STA NAND_RESULT          ; Store the result in NAND_RESULT

    ; Output NAND result
    PRINT "NAND operation result: "
    OUTPUT NAND_RESULT       ; Output the result of NAND

    ; -----------------------------
    ; Logical NOR Operation (NOT of OR)
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    OR NUM2                  ; Perform OR with NUM2
    NOT                      ; Perform NOT (NOR operation)
    STA NOR_RESULT           ; Store the result in NOR_RESULT

    ; Output NOR result
    PRINT "NOR operation result: "
    OUTPUT NOR_RESULT        ; Output the result of NOR

    ; -----------------------------
    ; Logical XNOR Operation (NOT of XOR)
    ; -----------------------------
    LDA NUM1                 ; Load NUM1 into Accumulator (AC)
    XOR NUM2                 ; Perform XOR with NUM2
    NOT                      ; Perform NOT (XNOR operation)
    STA XNOR_RESULT          ; Store the result in XNOR_RESULT

    ; Output XNOR result
    PRINT "XNOR operation result: "
    OUTPUT XNOR_RESULT       ; Output the result of XNOR

    ; End the program
    HALT

NUM1      DATA 0             ; Reserve space for the first number
NUM2      DATA 0             ; Reserve space for the second number
AND_RESULT DATA 0           ; Reserve space for the AND result
OR_RESULT  DATA 0           ; Reserve space for the OR result
XOR_RESULT DATA 0           ; Reserve space for the XOR result
NOT_RESULT DATA 0           ; Reserve space for the NOT result
NAND_RESULT DATA 0          ; Reserve space for the NAND result
NOR_RESULT  DATA 0          ; Reserve space for the NOR result
XNOR_RESULT DATA 0          ; Reserve space for the XNOR result

; Instructions:
; PRINT - prints a string to the screen
; INPUT - gets user input and stores it in the specified memory location
; LDA - Load a value from memory into the accumulator (AC)
; AND - Perform bitwise AND on the value in AC with the value from memory
; OR - Perform bitwise OR on the value in AC with the value from memory
; XOR - Perform bitwise XOR on the value in AC with the value from memory
; NOT - Perform bitwise NOT on the value in AC
; STA - Store the value in the accumulator (AC) into a memory location
; OUTPUT - print the value stored in the specified memory location
; HALT - Stops program execution

