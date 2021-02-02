data   segment
     string     db    'hello!$'
data   ends

code   segment
main    proc far
      assume cs:code, ds:data, es:data
start:
        push    ds
        sub      ax,ax
        push    ax
        mov     ax,data
        mov     ds,ax
        mov     es,ax      
        lea      dx,string
        mov    ah,09
        int       21h
        mov    ah,07
        int       21h  
        ret
main    endp
code   ends
         end   start
