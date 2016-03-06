.code16
.global start

start:	jmp loader

#include "print_string.asm"

loader:

	xorw	%ax, %ax
	movw	%ax, %ds
	movw	%ax, %es

	movw	MSG, %si
	call	print_string

	#int		$0x12


