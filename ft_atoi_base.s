section .text

global ft_atoi_base
extern ft_strlen

ft_atoi_base:
	push rdi
	push rsi
	mov rdi, rsi
	call parsing_base
	cmp rax, -1
	je .error
	pop rsi
	pop rdi
	mov rdx, 1
	mov rcx, 0
	mov rbx, 0
.loop_skip_white_space:
	mov al, byte [rdi]
	test al, al
	jz .ret_rax
	push rdi
	call ft_iswhitspace
	pop rdi
	cmp rax, -1
	je .inc_loop
.loop_minus_plus:
	mov al, byte [rdi]
	test al, al
	jz .ret_rax
	cmp al, '-'
	je .minus
	cmp al, '+'
	je .plus
.loop_number:
	mov al, byte [rdi]
	test al, al
	jz .ret_rax
	push rdi
	push rsi
	movzx rsi, byte [rdi]
	pop rdi
	call char_in_base
	mov rbx, rax
	cmp rax, -1
	je .ret_rax_unknown
	call ft_strlen
	mov rsi, rdi
	pop rdi
	imul rcx, rax
	add rcx, rbx
	inc rdi
	jmp .loop_number

.minus:
	neg rdx
.plus:
	inc rsi
	jmp .loop_minus_plus
	
.inc_loop:
	inc rdi
	jmp .loop_skip_white_space

.ret_rax_unknown:
	pop rdi
.ret_rax:
	imul rcx, rdx
	mov rax, rcx
	ret

.error:
	pop rdi
	pop rsi
	mov rax, 0
	ret

parsing_base:
	test rdi, rdi
	jz .error
	cmp byte [rdi], 0
	je .error
	cmp byte [rdi + 1], 0
	je .error

.first_loop:
	mov rcx, 0
	push rdi
	mov rax, rdi
	call ft_iswhitspace
	pop rdi
	je .error
	cmp rax, 0
	mov al, byte [rdi]
	test al, al
	jz .end_parsing
	cmp al, '+'
	je .error
	cmp al, '-'
	je .error
	inc rdi

.second_loop:
	mov dl, [rdi + rcx]
	test dl, dl
	jz .first_loop
	cmp dl, al
	je .error
	inc rcx
	jmp .second_loop
.error:
	mov rax, -1
	ret
.end_parsing:
	mov rax, 0
	ret


; rdi : chaine de string
; rsi : char
char_in_base:
	mov rax, 0
.loop_char:
	mov bl, byte [rdi + rax]
	test bl, bl
	jz .error
	cmp bl, sil
	je .ret_rax
	inc rax
	jmp .loop_char

	
.ret_rax:
	ret

.error:
	mov rax, -1
	ret

.end_parsing:
	mov rax, 0
	ret

.error_main:
	mov rax, 0
	ret

; rdi char
ft_iswhitspace:
	mov al, byte [rdi]
	cmp al, ' '
	je .it_is
	sub al, 9
	cmp al, 4
	jbe .it_is
	jmp .not

.it_is:
	mov rax, -1
	ret
.not:
	mov rax, 0
	ret


section .note.GNU-stack
