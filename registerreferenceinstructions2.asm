;Write an assembly language program to simulate the machine for following registerreference instructions and determine the contents of AC, E, PC, AR and IR registers indecimal after the execution

; Program to simulate Register Reference Instructions
; and determine contents of AC, E, PC, AR, and IR after execution

START:
    ; Initialize registers
    LDA NUM1                  ; Load NUM1 into AC
    STA AC_REG                ; Store initial value of AC in AC register

    LDA NUM2                  ; Load NUM2 into E
    STA E_REG                 ; Store initial value of E in E register

    ; Initial state printout
    PRINT "Initial state:"
    PRINT "AC: ", AC_REG
    PRINT "E: ", E_REG
    PRINT "PC: ", PC_REG
    PRINT "AR: ", AR_REG
    PRINT "IR: ", IR_REG

    ; CLA - Clear AC
    CLA
    PRINT "After CLA (Clear AC):"
    PRINT "AC: ", AC_REG

    ; CLE - Clear E
    CLE
    PRINT "After CLE (Clear E):"
    PRINT "E: ", E_REG

    ; CMA - Complement AC
    CMA
    PRINT "After CMA (Complement AC):"
    PRINT "AC: ", AC_REG

    ; CME - Complement E
    CME
    PRINT "After CME (Complement E):"
    PRINT "E: ", E_REG

    ; INC - Increment AC by 1
    INC
    PRINT "After INC (Increment AC by 1):"
    PRINT "AC: ", AC_REG

    ; SPA - Skip next instruction if AC > 0
    SPA
    PRINT "After SPA (Skip next if AC > 0):"
    PRINT "AC: ", AC_REG
    PRINT "PC: ", PC_REG

    ; SNA - Skip next instruction if AC < 0
    SNA
    PRINT "After SNA (Skip next if AC < 0):"
    PRINT "AC: ", AC_REG
    PRINT "PC: ", PC_REG

    ; SZA - Skip next instruction if AC == 0
    SZA
    PRINT "After SZA (Skip next if AC == 0):"
    PRINT "AC: ", AC_REG
    PRINT "PC: ", PC_REG

    ; SZE - Skip next instruction if E == 0
    SZE
    PRINT "After SZE (Skip next if E == 0):"
    PRINT "E: ", E_REG
    PRINT "PC: ", PC_REG

    ; Final state printout
    PRINT "Final state:"
    PRINT "AC: ", AC_REG
    PRINT "E: ", E_REG
    PRINT "PC: ", PC_REG
    PRINT "AR: ", AR_REG
    PRINT "IR: ", IR_REG

    HALT

; Data Section
NUM1      DATA 10             ; Initial value for NUM1 (AC = 10)
NUM2      DATA 5              ; Initial value for NUM2 (E = 5)
AC_REG    DATA 0              ; Reserve space for AC register
E_REG     DATA 0              ; Reserve space for E register
PC_REG    DATA 100            ; Reserve space for Program Counter (start with 100)
AR_REG    DATA 200            ; Reserve space for Address Register (AR)
IR_REG    DATA 0              ; Reserve space for Instruction Register (IR)

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
