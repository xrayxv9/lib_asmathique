section .text

global ft_strcmp

ft_strcmp:
	mov cl, byte [rdi] ; je ne peux pas faire deux fois byte sur une ligne donc je met le byte dans le cl
	cmp cl, byte [rsi] ; je fais la comparaison
	jne .exit ; jump non equal
	test cl, cl ; je check si c'est egale a \0
	je .exit ; jump equal
	inc rdi ; j'incremente mes chaines
	inc rsi
	jmp ft_strcmp ; je retourne au debut

.exit:
	movzx eax, byte [rdi]
	movzx ecx, byte [rsi]
	sub eax, ecx
	ret

section .note.GNU-stack
