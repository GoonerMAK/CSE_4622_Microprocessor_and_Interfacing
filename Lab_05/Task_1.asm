org 100h

.DATA 
    AVERAGE DW ?
    LARGEST DW 0
    SMALLEST DW 10
    COUNT DB 5
     
    SUM DW ?
    REMAINDER DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 0 
    MOV BX, 0
    MOV DX, 0
    
    MOV AH, 01h
    INT 21h
    MOV AH, 0
    
    SUB AL, 48
    MOV BX, AX
   
    DEC COUNT
    
    CMP AX, 09
    JBE NUMBER
    
    NUMBER:
        FIND_LARGEST:
            CMP AX, LARGEST
            JL FIND_LOWEST

        MOV LARGEST, AX
        
        FIND_LOWEST:    
            CMP AX, SMALLEST
            JG CONTINUE
        
        MOV SMALLEST, AX  
        
                  
        CONTINUE:
            CMP COUNT, 0
            JZ END 
            
            MOV CL, 04
            ROL AL, CL
            MOV AH, 01h
            INT 21h  
            MOV AH, 0
            
            SUB AL, 48
            ADD BX, AX  
            DEC COUNT
            
            CMP DX, DX
            JZ NUMBER
             
            
    END:    
    ; To calculate the Average 
    MOV AX, BX
    MOV CX, 5
    DIV CX
    
    MOV AVERAGE, AX  ; Average will contain the Average 
    MOV REMAINDER, DX
    
    MOV AH, 4Ch         
    INT 21h     
        
MAIN ENDP
END MAIN
RET
