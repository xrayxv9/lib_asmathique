section .text

global ft_list_remove_if
extern free

; rdi: t_list **
; rsi: void *data_ref
; rcx: (*cmp)()
; rdx: (*free_fct)(void *)
ft_list_remove_if:
	test rdi, rdi
	jz .finish
	cmp qword [rdi], 0
	je .finish
	test rsi, rsi
	jz .finish
	test rcx, rcx
	jz .finish
	test rdx, rdx
	jz .finish


.first_element:
	mov rbx, [rdi]
	push rdi
	mov rdi, [rbx + 8]
	push rbx
	push rcx
	push rdx
	call rcx
	pop rdx
	pop rcx
	pop rbx
	pop rdi
	cmp rax, 0
	je .remove_first
.loop_remains:
	test rbx, rbx
	jz .finish
	cmp qword [rbx], 0
	je .finish
	push rdi
	mov rax, [rbx]
	mov rdi, [rax + 8]
	push rbx
	push rcx
	push rdx
	call rcx
	pop rdx
	pop rcx
	pop rbx
	pop rdi
	cmp rax, 0
	je .remove_in_list
.add_values:
	mov rbx, [rbx]
	jmp .loop_remains


.remove_in_list:
	push rcx
	mov rax, [rbx]
	mov rcx, [rax]
	mov qword [rbx], rcx
	push rdi
	mov rcx, rax
	mov rdi, [rcx + 8]
	call rdx
	pop rdi
	pop rcx
	jmp .add_values
.remove_first:
	push rbx
	mov rax, [rdi]
	mov qword [rbx], rax
	mov [rdi], rbx
	pop rbx
	push rdi
	mov rdi, [rbx + 8]
	call rdx
	pop rdi
	jmp .first_element
.finish: 
	ret

section .note.GNU-stack
