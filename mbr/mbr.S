.code16
.globl start

# Global variables
REAL_MODE_MSG:
	.string "1. Start at 16-bit Real Mode.\0"

start:
	jmp loader

#include "print_string_rm.asm"
test:
	pusha
	mov			$0x0e,	%ah
	mov			$0x30,	%al
	int			$0x10
	popa
	ret

loader:
	movw		$REAL_MODE_MSG,	%bx
	call		print_string_rm

