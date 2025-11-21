section .text

global ft_list_size

ft_list_size:
	test rdi, rdi
	jz .error
	mov rax, rdi
	mov rbx, 0
.loop:
	test rax, rax
	jz .finish
	inc rbx
	mov rax, [rax]
	jmp .loop
.finish:
	mov rax, rbx
	ret
.error:
	mov rax, 0
	ret

section .not.GNU-stack
