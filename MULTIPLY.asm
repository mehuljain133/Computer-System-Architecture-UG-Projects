; Write an assembly program to simulate MULTIPLY operation on two user-enterednumbers.

; Assembly program to simulate MULTIPLY operation on two user-entered numbers
; This program multiplies two numbers by repeated addition.

START:
    ; Prompt user to enter the first number (Multiplicand)
    PRINT "Enter the first number (Multiplicand): "
    INPUT NUM1               ; User inputs the first number (Multiplicand)

    ; Prompt user to enter the second number (Multiplier)
    PRINT "Enter the second number (Multiplier): "
    INPUT NUM2               ; User inputs the second number (Multiplier)

    ; Initialize result to zero
    LDA ZERO                 ; Load zero into Accumulator (AC)
    STA RESULT               ; Store zero in RESULT (initialize the result)

    ; Initialize counter (to multiply by NUM2)
    LDA NUM2                 ; Load NUM2 (multiplier) into AC
    STA COUNTER              ; Store the multiplier in COUNTER

MULT_LOOP:
    LDA COUNTER              ; Load the current counter value into AC
    BEQ END_MULT             ; If counter is zero, end the multiplication loop

    LDA RESULT               ; Load the current result into AC
    ADD NUM1                 ; Add the multiplicand (NUM1) to the result
    STA RESULT               ; Store the new result

    LDA COUNTER              ; Load the current counter value into AC
    SUB ONE                  ; Subtract 1 from the counter (decrement)
    STA COUNTER              ; Store the new counter value

    BRA MULT_LOOP            ; Repeat the loop

END_MULT:
    ; Output the multiplication result
    PRINT "The result of multiplication is: "
    OUTPUT RESULT            ; Output the final result

    ; End the program
    HALT

; Data Section
NUM1      DATA 0             ; Reserve space for the first number (Multiplicand)
NUM2      DATA 0             ; Reserve space for the second number (Multiplier)
RESULT    DATA 0             ; Reserve space for the multiplication result
COUNTER   DATA 0             ; Reserve space for the counter (for NUM2)
ZERO      DATA 0             ; Reserve space for the constant zero
ONE       DATA 1             ; Reserve space for the constant one

; Instructions:
; PRINT - prints a string to the screen
; INPUT - gets user input and stores it in the specified memory location
; LDA - Load a value from memory into the accumulator (AC)
; ADD - Adds the value from memory to the accumulator (AC)
; STA - Store the value in the accumulator (AC) into a memory location
; SUB - Subtract the value from memory from the accumulator (AC)
; BEQ - Branch if equal (skip to END_MULT if counter is zero)
; BRA - Unconditional branch (jump to MULT_LOOP to repeat)
; OUTPUT - print the value stored in the specified memory location
; HALT - Stops program execution
