extern WriteConsoleA :PROC
extern GetStdHandle :PROC

.data
written dq 0

.code

; must set r10 and rcx  WriteConsole(handle, text, length, ...)
writeConsole PROC

    mov rcx, -11       
    sub rsp, 20h     
    call GetStdHandle
    add rsp, 20h
    mov rcx, rax             ; Handle in RCX
    
    mov rdx, r10   
    lea r9, written  

    sub rsp, 28h 
    xor rax, rax
    mov qword ptr [rsp+20h], rax                  
    call WriteConsoleA
    add rsp, 28h

    ret
writeConsole ENDP

; pulling Windows path from kuser and writing to console
main PROC
mov rcx, 7FFE0000h
lea rax, [rcx + 030h]
mov r10, rax
mov r8, 32
call WriteConsole
main ENDP
END
