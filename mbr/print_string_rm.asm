print_string_rm:
	pusha
	
	loop:
		movb	(%bx),	%al
		cmp 	$0x0,	%al
		je		print_string_rm_done
		push	%bx
		mov		$0x0e,	%ah
		int		$0x10
		pop		%bx
		inc		%bx
		jmp		loop
	print_string_rm_done:
		popa
		ret
