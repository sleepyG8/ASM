; RCX first word
; RDX second word
; void* myStrCmp(char* one, char* two);
.code 

myStrCmp PROC

xor rsi, rsi
myloop:

mov al, [rcx+rsi] 
mov r8b, [rdx+rsi] ; store char in 8 bit register
cmp al, r8b        ; cmp 2 chars
jne notEqual        

test al, al
jz equal

inc rsi
jmp myloop

notEqual:
mov rax, 1
ret

equal: 
mov rax, 0
ret
myStrCmp ENDP
END
