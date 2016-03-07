mbr: mbr.S print_string_rm.asm disk_load.asm
	gcc -m32 -c mbr.S
	ld -m elf_i386 -e start -Ttext=0x7c00 -o mbr mbr.o
	objcopy --strip-all --only-section=.text --output-target=binary mbr mbr
	ruby mkmbr.rb mbr
	make kernel
kernel: kernel.c
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel -Ttext=0x1000 kernel.o --oformat binary
	cat mbr kernel > os-img
	ruby mkimg.rb os-img
sc:
	rm -f mbr.o gdt.o mbr kernel.o kernel
run:
	qemu -curses os-img

clean:
	rm -f mbr.o gdt.o mbr kernel.o kernel os-img
