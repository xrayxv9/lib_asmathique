global ft_strlen

section .text
ft_strlen:
	mov rax, 0 ; I take a 64 bytes number to be sure that my text ain't long enought to make me overflow
	jmp loop ; i go to my my main loop (equivalent of a while)

loop:
	cmp byte [rdi + rax], 0x0 ; I compare with cmp the byte placed at rdi (the first parameter of my function) + my rax (my value that checks all the chars)
	je return
	inc rax
	jmp loop

return:
	ret 
