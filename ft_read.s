section .text

extern __errno_location
global ft_read

ft_read:
	mov eax, 0 ; syscall for read
	syscall 
	test rax, rax
	js .exit ; je jump si mon flag de sign est actif donc si je suis sur un nombre negatif donc erreur
	ret

.exit:
	mov rdi, rax
	neg rdi

	call __errno_location wrt ..plt
	
	mov [rax], rdi
	mov rax, -1
	ret

section .note.GNU-stack
