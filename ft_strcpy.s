global ft_strcpy
section .text

ft_strcpy:
	mov rax, rdi ; rax = first param

.loop:
	cmp byte [rsi], 0x0 ; check if *(second arg) == 0x0
	je .return ; if it is 0x0 goes to return
	movzx rcx, byte [rsi] ; copies the byte at * sri to rcx 
	; put to 0000 0000 rcx except for the last byte where it stores *rsi
	mov byte [rdi], cl ; moves the low part of the rcx register to *rdi
	inc rsi ; rax++
	inc rdi ; rbx++
	jmp .loop ; goes back to the begining

.return:
	mov byte [rdi], 0 ; puts the \0
	ret ; ret the rax which is the pointer untouched of the rsi

section .note.GNU-stack
