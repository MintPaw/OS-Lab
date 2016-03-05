mbr: mbr.S gdt.S
	gcc -m32 -c mbr.S gdt.S
	ld -m elf_i386 -e start -Ttext=0x7c00 -o mbr mbr.o gdt.o
	objcopy --strip-all --only-section=.text --output-target=binary mbr mbr
	ruby mkmbr.rb mbr

run:
	qemu -curses mbr

clean:
	rm -f mbr.o mbr
