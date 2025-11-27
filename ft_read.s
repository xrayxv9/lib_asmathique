section .text

extern __errno_location
global ft_read

ft_read:
	push	rbp
	mov		rbp, rsp
	xor		rax, rax	; syscall for read
	syscall
	test	rax, rax
	js		.exit		; je jump si mon flag de sign est actif donc si je suis sur un nombre negatif donc erreur
.end:
	pop		rbp
	ret

.exit:
	mov		rdi, rax
	neg		rdi

	call	__errno_location wrt ..plt
	
	mov		[rax], rdi
	mov		rax, -1
	jmp		rbp
