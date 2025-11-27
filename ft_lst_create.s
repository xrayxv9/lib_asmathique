section .text

extern malloc
global ft_lst_create

; Lorsqu'on fais des deplacement dans une operande memoire, il faut dire combien on va mettre dedans
; 1 = byte (ex: char)
; 2 = word (ex: short)
; 4 = dword (ex: int)
; 8 = qword (ex: pointer)

ft_lst_create:
	push	rbp
	mov		rbp, rsp

	push	rdi
	mov		rdi, 16
	call	malloc wrt ..plt
	pop		rdi
	test	rax, rax
	jz		.err
	
	mov		qword [rax], 0
	mov		qword [rax + 8], rdi

	jmp		.finish

.err:
	mov		rax, 0
.finish:
	pop		rbp
	ret
