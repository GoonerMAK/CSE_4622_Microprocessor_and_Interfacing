; Write an assembly code that will accept an input of 8 digits (0 to 9) from keyboard randomly
; and sort the odd digits in descending order                                                                                             

ORG 0100h

.DATA
ARRAY DB 8 DUP(?)
MAX_ODD DB 11
ODD_ARRAY DB 6 DUP(?)
                                                       
.CODE 
MAIN PROC     
   
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV CX, 8
    MOV SI, OFFSET ARRAY  
    
    LOOP_1:               ; This loop takes input into the array
        MOV AH, 01h
        INT 21h
        
        MOV [SI], AL
        INC SI              ; i++
        LOOP LOOP_1
        
    MOV DL, 10
    MOV AH, 02h
    INT 21h
              
    MOV DL, 13
    MOV AH, 02h
    INT 21h          
    
    FIND_ODD_LOOP:
        MOV CX, 8          
        MOV SI, OFFSET ARRAY
        MOV DI, OFFSET ODD_ARRAY
        
        ADD MAX_ODD, -2   
        
        
        SEARCH_LOOP:
            CMP CX, 0       
            JE END_FIND_ODD 
            
            MOV AL, [SI]
            MOV BL, [SI]
            SUB BL, 30h
            AND AL, 01h     
            CMP AL, 01h
            JZ ADD_TO_ODD  
            
            INC SI         
            LOOP SEARCH_LOOP 
            
        ADD_TO_ODD:
            CMP BL, MAX_ODD  
            JE ADD_ODD     
            
            INC SI         
            LOOP SEARCH_LOOP
            
        ADD_ODD:
            MOV [DI], BL    
            INC DI           
            
            MOV DL, BL     
            ADD DL, 30h    
            MOV AH, 02h
            INT 21h
            
            CMP MAX_ODD, 1
            JZ END_FIND_ODD
            
            JMP FIND_ODD_LOOP
            
        END_FIND_ODD:
    
    

    
    MOV AH, 4Ch         
    INT 21h           

MAIN ENDP 
END MAIN 
RET         


       