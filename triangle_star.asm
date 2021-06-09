.model small
.stack 100h
.data

    msg db "How many line you want to input : $"
    spc db " $"
    newl DB 010,013,"$" 
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
    SUB a,48
    
    lea dx,newl
    mov ah,09h
    int 21h
    
    mov bl,a
    sub bl,1 
    
    mov c,1
    
    first:
        CMP bl,0
        JE second
        
        mov cx,0 
        mov cl,bl
        
    space:
        lea dx,spc
        mov ah,09h
        int 21h
        loop space
        
    DEC bl
    
    second:
        mov cx,0
        mov cl,c
        
        CMP a,0
        JE EXIT
        
    star:
        mov ah,2
        mov dl,042
        int 21h
        loop star   
        
        lea dx,newl
        mov ah,09h
        int 21h
        
    INC c
    INC c
    DEC a
    
    JMP first 
    
    EXIT:
        mov ah,4ch
        int 21h
    main endp
end main
        
    