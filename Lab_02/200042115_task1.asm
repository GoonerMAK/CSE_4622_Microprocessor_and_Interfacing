ORG 0100h

.DATA


.CODE 
MAIN PROC  
    
    MOV AH, 01
    INT 21H

    MOV BL, AL 
         
    ; go to a new line with carriage return     
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21h   
            
    CMP BL, 97         
    JGE LOWER_TO_UPPER_CASE   ; if BL>97 then BL is small
    

    UPPER_TO_LOWER_CASE:      ; else BL is capital (convert it to small)

        ADD BL, 32 
         
        MOV AH, 02  
        MOV DL, BL    
        INT 21H

        JMP EXIT
       
       
    LOWER_TO_UPPER_CASE:


        SUB BL, 32

        MOV AH, 02
        MOV DL, BL        
        INT 21H  
        

    EXIT:                     ; return to DOS

        MOV AH, 4CH  
        INT 21H

MAIN ENDP 
END MAIN 
RET         


       