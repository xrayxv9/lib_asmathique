section .text

global ft_list_size

ft_list_size:
	push	rbp
	mov		rbp, rsp
	test	rdi, rdi
	jz		.error
	mov		rax, rdi
	xor		r8, r8
.loop:
	test	rax, rax
	jz		.finish
	inc		r8
	mov		rax, [rax]
	jmp		.loop
.finish:
	mov		rax, r8
	jmp		.ret
.error:
	mov		rax, 0
.ret:
	pop		rbp
	ret

section .not.GNU-stack
