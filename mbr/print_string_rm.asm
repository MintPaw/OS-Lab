print_string_rm:
	pusha
	
	loop:
		mov		(%bx),	%al
		cmp 	$0,		%al
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
