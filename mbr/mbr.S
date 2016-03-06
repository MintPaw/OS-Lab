.code16
.globl start
start:

	# set stack pointer
	movw		$0x9000,			%bp
	movw		%bp,				%sp

	# Announce that we are in real mode
	movw		$REAL_MODE_MSG,		%bx
	call		print_string_rm

	# Start to load kernel
	call		load_kernel
	jmp			.

.code16
load_kernel:
	movw		$LOAD_KERNEL_MSG,	%bx
	call		print_string_rm
	
	movw		$KERNEL_OFFSET,		%bx
	movb		$15,				%dh
	#movb		BOOT_DRIVE,			%dl
	#call		disk_load
	ret

#include "print_string_rm.asm"

# Global variables
REAL_MODE_MSG:
	.string "1. Start at 16-bit Real Mode.\r\n\0";

LOAD_KERNEL_MSG:
	.string "2. Loading kernel into memory.\r\n\0"

KERNEL_OFFSET:
	.word	0x1000
