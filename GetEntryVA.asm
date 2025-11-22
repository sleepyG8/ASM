; Getting entry point of a provided module
; Use GetModuleHandle(NULL) to get current process base
; pass the base address as a void* to as the first parameter

; extern void* getEntry(void*);

; RCX = BASE

.code

getEntry PROC

mov rbx, rcx                    ; base

mov eax, dword ptr [rcx+3Ch]    ; e_lfanew

add rax, rbx                    ; base + e_lfanew

mov eax, [rax+28h]              ; entry

add rax, rbx                    ; Base + entry

ret                             ; returning with final entry point as RAX

getEntry ENDP
END
