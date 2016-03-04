.code16

.global start

start:
	mov $0x0e, %ah
	mov 'H', %al
	int $0x10
