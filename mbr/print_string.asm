MSG:
	.string "Hello, world!\0" 

print_string:
	pusha
	loop:
		
	lodsb
	#cmpb %al, $0x0
	je	print_string_end
	mov $0x0e, %ah
	#mov $'T', %al
	int $0x10
	jmp print_string

print_string_end:
	ret
