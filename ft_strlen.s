section .text
global ft_strlen

ft_strlen:
	mov rax, rdi ; i put my parameter char * in the rax space

.loop: ; calling it .loop so that it a local thing
	cmp byte [rax], 0x0 ; Checking if the rax is currently on the 0x0 (NULL)
	je .return ; I call the return the return function to stop everything once on the null byte
	inc rax ; (*str)++
	jne .loop ; go back to the begining of the label '.loop'

.return:
	sub rax, rdi ; watching how many chars I have gone through
	ret ; returns rax

section .note.GNU-stack
