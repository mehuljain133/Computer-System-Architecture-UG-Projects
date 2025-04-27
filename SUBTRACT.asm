;Write an assembly program to simulate SUBTRACT operation on two user-enterednumbers.

; Assembly program to subtract two user-entered numbers
; This program will subtract the second number from the first number
; and display the result

START:
    ; Prompt user to enter the first number
    PRINT "Enter the first number: "
    INPUT NUM1            ; Get user input and store in NUM1

    ; Prompt user to enter the second number
    PRINT "Enter the second number: "
    INPUT NUM2            ; Get user input and store in NUM2

    ; Load the first number into the accumulator (AC)
    LDA NUM1              ; Load NUM1 into AC

    ; Subtract the second number from the accumulator (AC)
    SUB NUM2              ; Subtract NUM2 from AC

    ; Store the result in RESULT
    STA RESULT            ; Store the result in RESULT

    ; Print the result
    PRINT "The result is: "
    OUTPUT RESULT         ; Output the result stored in RESULT

    ; End the program
    HALT

NUM1    DATA 0           ; Reserve space for the first number
NUM2    DATA 0           ; Reserve space for the second number
RESULT  DATA 0           ; Reserve space for the result

; Instructions:
; PRINT - prints a string to the screen
; INPUT - gets user input and stores it in the specified memory location
; LDA - Load a value from memory into the accumulator (AC)
; SUB - Subtract the value from memory from the value in the accumulator (AC)
; STA - Store the value in the accumulator (AC) into a memory location
; OUTPUT - print the value stored in the specified memory location
; HALT - Stops program execution
