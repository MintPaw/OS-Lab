disk_load:
	push	%dx
	
	movb	$0x02,	%ah
	movb	%dh,	%al
	movb	$0x00,	%ch
	movb	$0x00,	%dh
	movb	$0x02,	%cl

	int		$0x13

	jc		disk_error	
	pop		%dx
	cmp		%dh,				%al
	jne		disk_error
	ret

disk_error:
	mov		$DISK_ERROR_MSG,	%bx
	call	print_string_rm
	jmp		.

DISK_ERROR_MSG:
	.string	"ERROR---Disk read error!\r\n\0"


