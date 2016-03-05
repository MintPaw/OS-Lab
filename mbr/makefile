mbr: mbr.S gdt.S
	gcc -m32 -c mbr.S gdt.S
	ld -m elf_i386 -e start -Ttext=0x7c00 -r mbr.o gdt.o -o mbr
	objcopy --strip-all --only-section=.text --output-target=binary mbr mbr
	ruby mkmbr.rb mbr
	make clean
run:
	qemu -curses mbr

clean:
	rm -f mbr.o gdt.o
