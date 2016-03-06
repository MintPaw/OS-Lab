print_string_rm:
	pusha
	
	loop:
		movb	(%bx),	%al
		cmp 	$0x0,	%al
		je		return
		push	%bx
		mov		$0x0e, %ah
		int		$0x10
		pop		%bx
		inc		%bx
		jmp		loop
	return:
		popa
		ret
