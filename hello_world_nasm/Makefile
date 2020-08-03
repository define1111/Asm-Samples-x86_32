AS = nasm
LD = ld

all: hello_world

hello_world: hello_world.o
	$(LD) -m elf_i386 $< -o $@

hello_world.o: hello_world.asm
	$(AS) -felf hello_world.asm

clean:
	rm -rf hello_world.o hello_world
