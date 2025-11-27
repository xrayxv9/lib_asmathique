section .text

extern ft_strlen
extern malloc
extern ft_strcpy
global ft_strdup

ft_strdup:
	push	rbp
	mov		rbp, rsp

	mov		r8, rdi
	call	ft_strlen
	mov		rdi, rax
	inc		rdi
	call	malloc wrt ..plt
	test	rax, rax
	jz		.malloc_failed
	mov		rdi, rax
	mov		rsi, r8
	call	ft_strcpy
.malloc_failed:
	pop		rbp
	ret
