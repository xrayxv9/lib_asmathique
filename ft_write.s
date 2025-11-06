section .text

extern __errno_location
global ft_write

ft_write:
	mov rax, 1 ; deplace 1 dans rax car il s'agit du numero de sysccall pour le write
	syscall ; besoin de rien de plus car tout les arguments sont deja dans rdi rsi et rdx
	cmp rax, 1
	jle .exit
	ret ; return la len si tout ce pass bien

.exit:
	mov rdi, rax ; stock le retour du syscall dans mon rdi pour ne pas le perdre
	neg rdi ; passe en positif la valeur erno retourné

	call __errno_location wrt ..plt ; call la table plt de mon errno ( en pointeur )

	mov [rax], rdi ; met le rdi dans la variable global erno
	mov rax, -1 ; return -1
	ret
