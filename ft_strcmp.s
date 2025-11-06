section .text

global ft_strcmp

ft_strcmp:
	mov cl, byte [rdi]
	cmp cl, byte [rsi]
	jne .exit
	test cl, byte [rsi]
	je .exit
	inc rdi
	inc rsi
	jmp ft_strcmp

.exit:
	movzx eax, byte [rdi]
	movzx ecx, byte [rsi]
	sub eax, ecx
	ret
