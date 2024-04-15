                  
                  
ORG 0100h

.DATA
CELSIUS DW 260
FARENHEIT DW ?

.CODE 
MAIN PROC 
    MOV AX, CELSIUS  
    MOV BX, 10
    
    MUL BX
    
    MOV BX, 5
    
    DIV BX
    
    MOV BX, 32
    
    ADD AX, BX
    
    MOV BX, 1
    
    SUB AX, BX
    
    MOV FARENHEIT, AX

MAIN ENDP 
END MAIN 
RET         


       