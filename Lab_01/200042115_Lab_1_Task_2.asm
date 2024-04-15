
; 0Bh * (200 - 225) + 127


ORG 0100h

.DATA
ANS DW ?

.CODE 
MAIN PROC 
    MOV AX, 0Bh      
    MOV BX, 200      
    
    SUB BX, 225      

    MUL BX           

    ADD AX, 127      

    MOV ANS, AX   

MAIN ENDP 
END MAIN 
RET
