;Write an assembly program that reads in integers and adds them together; until a negativenon-zero number is read in. Then it outputs the sum (not including the last number)

; Assembly program to add integers until a negative non-zero number is entered
; and then output the sum (excluding the last negative number)

START:
    LDA ZERO              ; Load 0 into AC to initialize sum (AC = 0)
    STA SUM               ; Store initial sum in SUM

LOOP:
    IN                     ; Input a number into AC
    STA TEMP               ; Store the number temporarily in TEMP
    BRZ END                ; If input is 0, end the loop (stop adding numbers)
    
    ; Check if the number is negative (AC < 0)
    BRP SKIP_NEGATIVE      ; If AC is positive or 0, skip the negative check
    LDA SUM                ; If AC is negative, do not add this number
    OUT                    ; Output the sum
    HALT                   ; End the program

SKIP_NEGATIVE:
    LDA SUM                ; Load current sum
    ADD TEMP               ; Add the current input (TEMP) to the sum
    STA SUM                ; Store the new sum in SUM

    BR LOOP                ; Go back to the loop for the next input

END:
    LDA SUM                ; Load final sum into AC
    OUT                    ; Output the sum
    HALT                   ; Stop execution

; Data section
ZERO      DATA 0           ; Zero constant for initializing sum
SUM       DATA 0           ; Store the sum of integers
TEMP      DATA 0           ; Temporary storage for the current input
