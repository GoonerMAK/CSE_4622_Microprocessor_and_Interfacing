
; Task: (30 + 15) * (575 - 225) + 210

ORG 0100h

.DATA
ANS DW ?

.CODE 
MAIN PROC 
    MOV AX, 30      
    ADD AX, 15       

    MOV BX, 575      
    SUB BX, 225     

    MUL BX          

    ADD AX, 210     

    MOV ANS, AX  

MAIN ENDP 
END MAIN 
RET
