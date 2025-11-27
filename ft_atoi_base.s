section .text

global ft_atoi_base
extern ft_strlen

ft_atoi_base:
	push	rbp
	mov		rbp, rsp
	test	rdi, rdi
	jz		.ret_rax
	test	rsi, rsi
	jz		.ret_rax
	push	rdi
	push	rsi
	mov		rdi, rsi
	call	parsing_base
	cmp		rax, -1
	je		.error
	pop		rsi
	pop		rdi
	mov		rdx, 1
	mov		rcx, 0
	mov		r8, 0
.loop_skip_white_space:
	mov		al, byte [rdi]
	test	al, al
	jz		.ret_rax
	push	rdi
	call	ft_iswhitspace
	pop		rdi
	cmp		rax, -1
	je		.inc_loop
.loop_minus_plus:
	movzx	rax, byte [rdi]
	test	al, al
	jz		.ret_rax
	cmp		al, '-'
	je		.minus
	cmp		al, '+'
	je		.plus
.loop_number:
	movzx	rax, byte [rdi]
	test	al, al
	jz		.ret_rax
	push	rdi
	push	rsi
	movzx	rsi, byte [rdi]
	pop		rdi
	call	char_in_base
	mov		r8, rax
	cmp		rax, -1
	je		.ret_rax_unknown
	call	ft_strlen
	mov		rsi, rdi
	pop		rdi
	imul	rcx, rax
	add		rcx, r8
	inc		rdi
	jmp		.loop_number

.minus:
	neg		rdx
.plus:
	inc		rdi
	jmp		.loop_minus_plus
	
.inc_loop:
	inc		rdi
	jmp		.loop_skip_white_space

.ret_rax_unknown:
	pop		rdi
.ret_rax:
	imul	rcx, rdx
	mov		rax, rcx
	jmp		.ret
.error:
	pop		rdi
	pop		rsi
	mov		rax, 0
.ret:
	pop rbp
	ret


parsing_base:
	push	rbp
	mov		rbp, rsp

	cmp		byte [rdi], 0
	je		.error
	cmp		byte [rdi + 1], 0
	je		.error

.first_loop:
	mov		rcx, 0
	movzx	rax, byte [rdi]
	test	al, al
	jz		.end_parsing
	call	ft_iswhitspace
	cmp		rax, -1
	je		.error
	cmp		al, '+'
	je		.error
	cmp		al, '-'
	je		.error
	inc		rdi

.second_loop:
	movzx	rdx, byte [rdi + rcx]
	test	dl, dl
	jz		.first_loop
	cmp		dl, al
	je		.error
	inc		rcx
	jmp		.second_loop
.error:
	mov		rax, -1
	jmp		.ret
.end_parsing:
	mov		rax, 0
.ret:
	pop		rbp
	ret

; rdi : chaine de string
; rsi : char
char_in_base:
	push	rbp
	mov		rbp, rsp
	mov		rax, 0
.loop_char:
	mov		bl, byte [rdi + rax]
	test	bl, bl
	jz		.error
	cmp		bl, sil
	je		.ret_rax
	inc		rax
	jmp		.loop_char
.error:
	mov		rax, -1
.ret_rax:
	pop		rbp
	ret

; rdi char
ft_iswhitspace:
	push	rbp
	mov		rbp, rsp
	mov		al, byte [rdi]
	cmp		al, ' '
	je		.it_is
	sub		al, 9
	cmp		al, 4
	jbe		.it_is
	jmp		.not
.it_is:
	mov		rax, -1
	jmp		.ret
.not:
	mov		rax, 0
.ret:
	pop		rbp
	ret
