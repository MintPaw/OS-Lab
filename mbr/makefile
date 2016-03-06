mbr: mbr.S print_string_rm.asm
	gcc -m32 -c mbr.S
	ld -m elf_i386 -e start -Ttext=0x7c00 -o mbr mbr.o
	objcopy --strip-all --only-section=.text --output-target=binary mbr mbr
	ruby mkmbr.rb mbr
kernel: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
run:
	qemu -curses mbr

clean:
	rm -f mbr.o gdt.o mbr
