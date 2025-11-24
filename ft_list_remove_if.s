section .text

global ft_list_remove_if
extern free

; rdi: t_list **
; rsi: void *data_ref
; rdx: (*cmp)()
; rcx: (*free_fct)(void *)
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
	
	push r12
	push r13
	push r14
	push r15

	mov r12, rdi
	mov r13, rsi
	mov r14, rdx
	mov r15, rcx

.first_element:
	mov rbx, [r12]
	test rbx, rbx
	je .finish
	mov rdi, [rbx + 8]
	mov rsi, r13
	call r14
	cmp rax, 0
	je .remove_first
.loop_remains:
	test rbx, rbx
	jz .finish
	cmp qword [rbx], 0
	je .finish
	mov rax, [rbx]
	mov rdi, [rax + 8]
	mov rsi, r13
	call r14
	cmp rax, 0
	je .remove_in_list
.add_values:
	mov rbx, [rbx]
	jmp .loop_remains


.remove_in_list:
	mov r8, [rbx]
	mov r9, [r8]
	mov qword [rbx], r9
	mov rdi, [r8 + 8]
	call r15
	mov rdi, r8
	call free wrt ..plt
	jmp .add_values
.remove_first:
	mov rax, [rbx]
	mov [r12], rax
	mov rdi, [rbx + 8]
	call r15
	mov rdi, rbx
	call free wrt ..plt
	jmp .first_element
.finish: 
	pop r15
	pop r14
	pop r13
	pop r12
	ret

section .note.GNU-stack
