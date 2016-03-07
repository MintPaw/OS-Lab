.code16
.globl start
start:

	# BIOS stores the boot drive in DL register, save it.
	movb		%dl,				BOOT_DRIVE

	# set stack pointer
	movw		$0x9000,			%bp
	movw		%bp,				%sp

	# Announce that we are in real mode
	movw		$REAL_MODE_MSG,		%bx
	call		print_string_rm

	# Start to load kernel
	call		load_kernel

	# Switch to 32-bit protected mode
	# call		switch_to_pm
	jmp			.

.code16
load_kernel:
	movw		$LOAD_KERNEL_MSG,	%bx
	call		print_string_rm
	
	movw		KERNEL_OFFSET,		%bx
	movb		$2,					%dh
	movb		(BOOT_DRIVE),		%dl
	call		disk_load

	push		%bx
	movw		$READ_DONE_MSG,		%bx
	call		print_string_rm
	pop			%bx
	ret

#switch_to_pm:
#	cli
#	lgdt		gdt_descriptor
#	movl		%cr0,		%eax
#	orl			$0x1,		%eax
#	movl		%eax,		%cr0
#	ljmp		$CODE_SEG,	$init_pm

#init_pm:
#	movw		$DATA_SEG,	%ax
#	movw		%ax,		%ds
#	movw		%ax,		%es
#	movw		%ax,		%ss
#	movl		$0x9000,	%esp
#	movl		%esp,		%ebp
#	call		BEGIN_PM

#include "print_string_rm.asm"
#include "disk_load.asm"
#include "gdt.asm"

# Global variables
BOOT_DRIVE:
	.byte	0x0
REAL_MODE_MSG:
	.string "1. Start at 16-bit Real Mode.\r\n\0"
LOAD_KERNEL_MSG:
	.string "2. Loading kernel into memory.\r\n\0"
READ_DONE_MSG:
	.string	"Read done!\r\n\0"
KERNEL_OFFSET:
	.word	0x1000
