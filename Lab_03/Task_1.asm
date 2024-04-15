ORG 0100h

.DATA
input_string DB 'We are IUT Students', 0Dh, 0Ah, '$'
len DB 0                                                 ; It'll work as a counter
                                                        
.CODE 
MAIN PROC     
   
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV AH, 9
    LEA DX, input_string
    INT 21h  
          
    MOV SI, offset input_string
    
    top:
        MOV AL, [SI]
        Cmp AL, '$'         ; Comparing end of string
        JE  end  
        INC SI 
        INC len  
                                                                       
    loop top    
    
    end:
        MOV DL, len
        ADD DL, 30h     ; Converting int to character  (ASCII Conversion)
        MOV AH, 2h    
        INT 21h            
    
    MOV AH, 4Ch         
    INT 21h           

MAIN ENDP 
END MAIN 
RET         


       