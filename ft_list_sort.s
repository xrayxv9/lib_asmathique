section .text

global ft_list_sort

; rdi: t_list **
; rsi: pointeur sur fct
; pour le moment je ne check pas si le pointeur de la fonction est NULL car je ne sais pas ce que ca fais (seg fault TREEEEEES probablement)
ft_list_sort:
	push	rbp
	mov		rbp, rsp

	test	rdi, rdi
	jz		.finish
	test	rdi, [rdi]
	jz		.finish
	test	rsi, rsi
	jz		.finish
	mov		r8, [rdi]
.first_loop:
	test	r8, r8
	jz		.finish
	mov		rcx, [r8]
.second_loop:
	test	rcx, rcx
	jz		.end_loop
	cmp		qword [rcx], 0
	je		.end_loop
	push	rdi
	push	rsi
	mov		rdx, rsi
	push	rcx
	push	r8
	mov		rdi, [r8 + 8]
	mov		rsi, [rcx + 8]
	call	rdx
	pop		r8
	pop		rcx
	cmp		rax, 0
	jle		.add_values
.call:
	mov		rdi, r8
	mov		rsi, rcx
	push	rcx
	push	r8
	call	swap
	pop		r8
	pop		rcx
.add_values:
	pop		rsi
	pop		rdi
	mov		rcx, [rcx]
	jmp		.second_loop
.end_loop:
	mov		r8, [r8]
	jmp		.first_loop

	
.finish: 
	pop		rbp
	ret

; rdi: r8
; rsi: rcx
swap:
	push	rbp
	mov		rbp, rsp
	mov		rcx, [rdi + 8]
	mov		r8, [rsi + 8]
	mov		qword [rdi + 8], r8
	mov		qword [rsi + 8], rcx
	pop		rsp
	ret

section .note.GNU-stack
