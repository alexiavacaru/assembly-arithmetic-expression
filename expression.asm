; Title: Arithmetic Expression Implementation
; Logic: {[(a:b+c)*d]:e}*f+g

segm_stiva        SEGMENT
    stiva         DW 128 DUP (?)
segm_stiva        ENDS

segm_date         SEGMENT
    a             DW 4
    b             DW 2
    c             DW 13
    d             DW 8
    e             DW 12
    f             DW 7
    g             DW 2
    rez           DW ?
    msg           DB "P22-1012, Vacaru Alexia"
segm_date         ENDS

segm_cod          SEGMENT
    ASSUME CS:segm_cod, DS:segm_date, SS:segm_stiva
    et:
        ; Initialize Data Segment
        MOV AX, segm_date
        MOV DS, AX

        ; Start Expression Calculation
        MOV  AX, a
        DIV  b          ; Step 1: a / b
        ADD  AX, c      ; Step 2: result + c
        MUL  d          ; Step 3: result * d
        DIV  e          ; Step 4: result / e
        MUL  f          ; Step 5: result * f
        ADD  AX, g      ; Step 6: result + g

        MOV  rez, AX    ; Save final result to memory

        ; Terminate Program
        MOV AX, 4C00H
        INT 21H
segm_cod          ENDS
END et
