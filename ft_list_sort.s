section .text

global ft_list_sort

; rdi: t_list **
; rsi: pointeur sur fct
; pour le moment je ne check pas si le pointeur de la fonction est NULL car je ne sais pas ce que ca fais (seg fault TREEEEEES probablement)
ft_list_sort:
	test rdi, rdi
	jz .finish
	test rdi, [rdi]
	jz .finish
	mov rbx, [rdi]
.first_loop:
	test rbx, rbx
	jz .finish
	mov rcx, [rbx]
.second_loop:
	test rcx, rcx
	jz .end_loop
	cmp qword [rcx], 0
	je .end_loop
	push rdi
	push rsi
	mov rdx, rsi
	push rcx
	push rbx
	mov rdi, [rbx + 8]
	mov rsi, [rcx + 8]
	call rdx
	pop rbx
	pop rcx
	cmp rax, 0
	jg .call
.add_values:
	pop rsi
	pop rdi
	mov rcx, [rcx]
	jmp .second_loop
.end_loop:
	mov rbx, [rbx]
	jmp .first_loop
.call:
	mov rdi, rbx
	mov rsi, rcx
	push rcx
	push rbx
	call swap
	pop rbx
	pop rcx
	jmp .add_values
	
	
.finish: 
	ret

; rdi: rbx
; rsi: rcx
swap:
	mov rcx, [rdi + 8]
	mov rbx, [rsi + 8]
	mov [rdi + 8], rbx
	mov [rsi + 8], rcx
	ret

	

section .note.GNU-stack
