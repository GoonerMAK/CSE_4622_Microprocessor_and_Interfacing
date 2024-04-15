org 100h

.DATA 
    A db 1, 2, 3, 4, 5, 6, 7, 8, 9
    message db 'The value of N in between 2-9: $'   
    Result dw ?

.CODE
MAIN PROC
    mov ax, @DATA
    mov ds, ax
    xor ax,ax 
    
    mov si, OFFSET A
    mov dx, OFFSET message 
    
    mov ah, 09h ; display string function
    int 21h ; display message  
    
    mov ah, 01h
    int 21h
    mov cl, al
    sub cl, 48 ; to convert the ascii value of 3 to decimal 3
    
    MOV BX, 0 
    
Loop_1:
    MOV al, [Si]
    MUL AL  
    ADD BX, AX
    inc Si
    loop Loop_1 
    
      
    MOV Result, BX  
    
    ; print output
    mov ax, 02h
    mov dx, bx
    int 21h 
    
MAIN ENDP
END MAIN
RET
