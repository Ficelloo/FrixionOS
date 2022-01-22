all:
	nasm -f bin -o build/bootloader src/bootloader.asm
	nasm -f bin -o build/kernel src/kernel.asm
	cat build/bootloader build/kernel /dev/zero | dd of=build/floppyA bs=512 count=2880
	
run:
	qemu-system-i386 -boot a -fda build/floppyA

clean:
	rm -rf build
	mkdir build
