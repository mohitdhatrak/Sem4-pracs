DATA SEGMENT 
    ARR DB 5, 3, 7, 1, 9, 2, 6, 8, 4
    LEN DW $-ARR
    MIN DB ?
    MAX DB ?
DATA ENDS 

CODE SEGMENT 
    ASSUME CS: CODE, DS:DATA

    START:
        MOV AX, DATA
        MOV DS, AX 
        
        LEA SI, ARR
        MOV AL, ARR[SI]
        MOV MIN, AL
        MOV MAX, AL
        MOV CX, LEN
        
        REPEAT:
        MOV AL, ARR[SI]
        CMP MIN, AL
        JL CHECKMAX
        MOV MIN, AL
        
        CHECKMAX:
        CMP MAX, AL
        JG DONE
        MOV MAX, AL
        
        DONE:
        INC SI
        ; LOOP REPEAT
        DEC CX
        JNZ REPEAT
        
        MOV AH, 4CH
        INT 21H
    END START
CODE ENDS