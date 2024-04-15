ORG 0100h

.DATA
letter DB ?
letter_backwards DB ?

.CODE
MAIN PROC

    MOV AH, 01h
    INT 21h 
    MOV letter, AL
    
    CMP AL, 'a'
    JL  MAKE_IT_LOWER_CASE     ; jump if AL < 'a'
    
    SUB AL, 32
    MOV letter, AL
    MOV letter_backwards, AL
    MOV CX, 5
    
NEXT_LETTERS_CAPITAL:
    INC letter
    CMP letter, 'Z'
    JLE PRINT_LETTER_CAPITAL 
    MOV letter, 'A'
        
PRINT_LETTER_CAPITAL:
    MOV AH, 02h
    MOV DL, letter
    INT 21h
    CMP CX, 1h  
    JLE NEXT_LETTERS_END
    LOOP NEXT_LETTERS_CAPITAL
    
                      
MAKE_IT_LOWER_CASE:
    ADD AL, 32 
    MOV letter, AL
    MOV letter_backwards, AL
    MOV CX, 5

NEXT_LETTERS_SMALL:
    INC letter
    CMP letter, 'z'
    JLE PRINT_LETTER_SMALL 
    MOV letter, 'a'

PRINT_LETTER_SMALL:
    MOV AH, 02h
    MOV DL, letter
    INT 21h
    LOOP NEXT_LETTERS_SMALL
 
NEXT_LETTERS_END:
    MOV letter, AL
    MOV CX, 5             
     
     
CHECK_BACKWARD_LETTER_CASE:
    CMP letter_backwards, 'a'                ; Backward Letter is Capital
    JL  PREV_LETTERS_CAPITAL
    
PREV_LETTERS_SMALL:
    DEC letter_backwards          
    CMP letter_backwards, 'a'
    JGE PRINT_PREV_LETTER_SMALL
    MOV letter_backwards, 'z' 
    
PRINT_PREV_LETTER_SMALL:
    MOV AH, 02h
    MOV DL, letter_backwards
    INT 21h 
    CMP CX, 1h  
    JLE PREV_LETTERS_END   
    LOOP PREV_LETTERS_SMALL         

         
PREV_LETTERS_CAPITAL: 
    DEC letter_backwards          
    CMP letter_backwards, 'A'
    JGE PRINT_PREV_LETTER_CAPITAL
    MOV letter_backwards, 'Z'
        

PRINT_PREV_LETTER_CAPITAL:
    MOV AH, 02h
    MOV DL, letter_backwards
    INT 21h    
    LOOP PREV_LETTERS_CAPITAL         


PREV_LETTERS_END:

    ; Return to DOS
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
