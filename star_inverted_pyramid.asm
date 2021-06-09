.model small
.stack 100h
.data

    msg db "Enter how many line you want to print : $"
    newl db 010,013,"$"
    a db ? 
    c db ?
    
.code
main proc
    
    mov AX,@DATA
    mov DS,AX
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ah,1
    int 21h
    mov a,al 
    
    mov bl,a
    sub bl,48
    
    lea dx,newl
    mov ah,09h
    int 21h 
    
    mov c,0
    
    star:
        CMP bl,c
        JE exit 
        
        mov cx,0
        mov cl,bl
        
    LOOP:    
        mov ah,2
        mov dl,042
        int 21h 
        LOOP LOOP  
        
    lea dx,newl
    mov ah,09h
    int 21h
        
    DEC bl
    JMP star
    
    exit:
        mov ah,4ch
        int 21h
        
    main endp
end main
        
        
        
        