; Write an assembly program that reads in integers and adds them together; until zero isread in. Then it outputs the sum.

; Assembly program to add integers until a zero is entered
; and then output the sum.

START:
    LDA ZERO              ; Load 0 into AC to initialize the sum (AC = 0)
    STA SUM               ; Store initial sum in SUM

LOOP:
    IN                     ; Input a number into AC
    BRZ END                ; If input is 0, stop the loop (zero input means stop)
    
    LDA SUM                ; Load current sum
    ADD AC                 ; Add the current input (AC) to the sum
    STA SUM                ; Store the updated sum back into SUM
    
    BR LOOP                ; Go back to the loop for the next input

END:
    LDA SUM                ; Load the final sum into AC
    OUT                    ; Output the sum
    HALT                   ; End the program

; Data section
ZERO      DATA 0           ; Zero constant for initializing sum
SUM       DATA 0           ; Store the sum of integers
