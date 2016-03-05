#include "gdt.S"

.code16
.global start

start:
	cli
	mov $0x13, %ah
	mov $0x01, %al
	mov $0x00, %bh
	mov $0x4f, %bl
	mov $(end - str), %cx
	mov $str, %dx
	mov %dx, %bp
	mov $0x00, %dh
	mov $0x00, %dl
	int $0x10

switch_to_pm:
	cli
	lgdt gdt_descriptor
	
	movl %cr0, %eax
	orl	 $0x1, %eax
	movl %eax, %cr0
	
	ljmp $CODE_SEG, $init_pm
	 

str:
	.ascii "Hello, world!"
end:


.code32
init_pm:
	movw $DATA_SEG, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %ss

	movl $0x8000, %esp

