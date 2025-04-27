; Write an assembly program to simulate ADD operation on two user-entered numbers

; Assembly program to add two user-entered numbers
; Assumes a basic CPU with instructions for:
; - Input (getting user input)
; - Output (printing result)
; - Loading values into registers
; - Adding values in registers

START:
    ; Prompt user to enter first number
    PRINT "Enter the first number: "
    INPUT NUM1            ; Get user input and store in NUM1

    ; Prompt user to enter second number
    PRINT "Enter the second number: "
    INPUT NUM2            ; Get user input and store in NUM2

    ; Load first number into accumulator (AC)
    LDA NUM1              ; Load NUM1 into AC

    ; Add second number to accumulator (AC)
    ADD NUM2              ; Add NUM2 to AC

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
; ADD - Add the value from memory to the value in the accumulator (AC)
; STA - Store the value in the accumulator (AC) into a memory location
; OUTPUT - print the value stored in the specified memory location
; HALT - Stops program execution
