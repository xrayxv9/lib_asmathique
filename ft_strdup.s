section .text


extern __errno_location
extern ft_strlen
extern malloc
extern strcpy
global ft_strdup

ft_strdup:
	mov rbx, rdi
	call ft_strlen
	mov rdi, rax
	call malloc
