section .text

global ft_atoi_base
global ft_strlen

ft_atoi_base:
	push rdi
	push rsi
	mov rdi, rsi
	call parsing_base
	cmp rax, -1
	je .error_main
	pop rsi
	pop rdi
	mov rax, 0
.loop_skip_white_space
	mov al, byte [rsi]
	test al, al
	jz .ret_rax
	cmp al, ' '
	je .inc_loop
	sub al, 9
	cmp al, 4
	jbe .inc_loop
.loop_minus_plus
	mov al, byte [rsi]
	test al, al
	jz .ret_rax
	cmp al, '-'
	je .inc_loop
	cmp al, '+'
	je .inc_loop


	
.inc_loop
	inc rsi
	jmp .loop_skip_white_space

parsing_base:
	test rdi, rdi
	jz .error
	cmp byte [rdi], 0
	je .error
	cmp byte [rdi + 1], 0
	je .error

.first_loop:
	mov al, byte [rdi]
	test al, al
	jz .end_parsing
	cmp al, '+'
	je .error
	cmp al, '-'
	je .error
	lea rax, [rdi + 1]
	inc rdi

.second_loop:
	mov cl, byte [rax]
	test cl, cl
	jz .first_loop
	cmp cl, al
	je .error
	inc rax
	jmp .second_loop

; rdi : chaine de string
; rsi : char
char_in_base:
	mov rax, 0
.loop_char:
	mov al, byte [rdi]
	test al, al
	jz .error
	cmp al, rsi
	je .ret_rax
	inc rax
	inc rdi
	jmp .loop_char

	
.ret_rax:
	ret

.finish_char:
	mov rax, 
.error:
	mov rax, -1
	ret

.end_parsing:
	mov rax, 0
	ret

.error_main:
	mov rax, 0
	ret
