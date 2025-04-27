;Write an assembly language program to simulate the machine for following registerreference instructions and determine the contents of AC, E, PC, AR and IR registers indecimal after the execution

; Simulate register reference instructions with tracking of registers
START:
    ; Initializing registers to arbitrary values
    LDA NUM1                 ; Load NUM1 into AC
    STA AC_REG               ; Store initial value in AC register (AC = NUM1)

    ; Example operations simulating register reference instructions
    PRINT "Initial state:"
    PRINT "AC: ", AC_REG
    PRINT "E: ", E_REG
    PRINT "PC: ", PC_REG
    PRINT "AR: ", AR_REG
    PRINT "IR: ", IR_REG

    ; CLA (Clear AC)
    CLA
    PRINT "After CLA:"
    PRINT "AC: ", AC_REG

    ; CLE (Clear E)
    CLE
    PRINT "After CLE:"
    PRINT "E: ", E_REG

    ; CMA (Complement AC)
    CMA
    PRINT "After CMA:"
    PRINT "AC: ", AC_REG

    ; CME (Complement E)
    CME
    PRINT "After CME:"
    PRINT "E: ", E_REG

    ; INC (Increment AC)
    INC
    PRINT "After INC:"
    PRINT "AC: ", AC_REG

    ; SPA (Skip next instruction if AC > 0)
    SPA
    PRINT "After SPA (if AC > 0, next instruction skipped):"
    PRINT "AC: ", AC_REG
    PRINT "PC: ", PC_REG

    ; SNA (Skip next instruction if AC < 0)
    SNA
    PRINT "After SNA (if AC < 0, next instruction skipped):"
    PRINT "AC: ", AC_REG

    ; SZA (Skip next instruction if AC == 0)
    SZA
    PRINT "After SZA (if AC == 0, next instruction skipped):"
    PRINT "AC: ", AC_REG

    ; SZE (Skip next instruction if E == 0)
    SZE
    PRINT "After SZE (if E == 0, next instruction skipped):"
    PRINT "E: ", E_REG

    ; Final state
    PRINT "Final state:"
    PRINT "AC: ", AC_REG
    PRINT "E: ", E_REG
    PRINT "PC: ", PC_REG
    PRINT "AR: ", AR_REG
    PRINT "IR: ", IR_REG

    HALT

; Data Section
NUM1      DATA 5            ; Initial value for NUM1 (AC = 5)
NUM2      DATA 3            ; Initial value for NUM2
AC_REG    DATA 0            ; Reserve space for AC register
E_REG     DATA 1            ; Reserve space for E register (start with 1)
PC_REG    DATA 100          ; Reserve space for Program Counter (start with 100)
AR_REG    DATA 200          ; Reserve space for Address Register (AR)
IR_REG    DATA 0            ; Reserve space for Instruction Register (IR)

; Instructions:
; CLA - Clear the AC (AC = 0)
; CLE - Clear the E (E = 0)
; CMA - Complement the AC (flip bits of AC)
; CME - Complement the E (flip bits of E)
; INC - Increment the AC by 1
; SPA - Skip next instruction if AC > 0
; SNA - Skip next instruction if AC < 0
; SZA - Skip next instruction if AC == 0
; SZE - Skip next instruction if E == 0
; PRINT - Print values to output
; HALT - Stop execution
