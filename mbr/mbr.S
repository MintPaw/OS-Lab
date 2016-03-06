.code16
.globl start

start:
	jmp loader

#include "print_string_rm.asm"

# Global variables
REAL_MODE_MSG:
	.string "Start at 16-bit Real Mode.\0"

loader:
	movw		REAL_MODE_MSG,	%bx
	call		print_string_rm

