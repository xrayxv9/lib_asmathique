section .text


extern __errno_location
extern ft_strlen
extern malloc
extern ft_strcpy
global ft_strdup

ft_strdup:
	push rbp
	mov rbp, rsp
	mov rbx, rdi
	call ft_strlen
	mov rdi, rax
	inc rdi
	call malloc wrt ..plt
	test rax, rax
	jz .malloc_failed
	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy
	pop rbp
	ret

.malloc_failed:
	mov rax, 0
	ret
