MSG:
	.string "Hello, world!", 0

print_string:
	#lodsb
	#or	%al, %al
	#jz	print_string_end
	mov $0x0e, %ah
	mov $'T', %al
	int $0x10
	#jmp print_string

print_string_end:
	ret
