AS = nasm
LD = ld

all: hello_world_while

hello_world_while: hello_world_while.o
	$(LD) -m elf_i386 $< -o $@

hello_world_while.o: hello_world_while.asm
	$(AS) -felf $<

clean:
	rm -rf hello_world_while.o hello_world_while
