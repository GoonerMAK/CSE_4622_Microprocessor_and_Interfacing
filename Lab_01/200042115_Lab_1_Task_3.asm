                          
; 0FFFh * 10h + 1111b

ORG 0100h
                          

.DATA
ANS DW ?

.CODE
MAIN PROC
    
    MOV AX, 0FFFh
    MOV BX, 10h
    
    MUL BX
    
    ADD AX, 1111b
    
    MOV ANS, AX
    
MAIN ENDP
END MAIN
RET