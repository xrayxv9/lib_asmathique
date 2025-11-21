section .text

global ft_list_push_front
extern ft_lst_create

ft_list_push_front:
	test rdi, rdi
	jz .error
	push rdi
	mov rdi, rsi
	call ft_lst_create
	pop rdi
	test rax, rax
	jz .error
	mov rbx, [rdi]
	mov qword [rax], rbx
	mov [rdi], rax
	ret
	
.error:
	ret

section .note.GNU-stack
