section .text

extern ft_strlen
extern malloc
extern ft_strcpy
global ft_strdup

ft_strdup:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	mov		qword [rbp - 8], rdi
	call	ft_strlen
	mov		rdi, rax
	inc		rdi
	call	malloc wrt ..plt
	test	rax, rax
	jz		.malloc_failed
	mov		rdi, rax
	mov		rsi, qword [rbp - 8]
	call	ft_strcpy
.malloc_failed:
	add		rsp, 16
	pop		rbp
	ret
