        global  _ft_read

        extern  ___error

_ft_read:
        mov     rax, 0x02000003     ; syscall for read
        syscall                     ; if error occurs it sets carry flag and return value (errno) will be saved in rax, otherwise it returns number of read bytes
        jc      set_errno           ; if carry flag is set then we know error occured
        ret            

set_errno:
        mov     r9, rax             ; save value returned from syscall
        call    ___error            ; it returns address to external variable errno
        mov     [rax], r9           ; put returned value from syscall in external variable errno 
        mov     rax, -1             ; set return to -1 as error occured
        ret