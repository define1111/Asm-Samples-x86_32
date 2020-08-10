AS = nasm
LD = ld

LDFLAGS = -m elf_i386

all: hello_world_while hello_world_while_ecx

hello_world_while: hello_world_while.o
	$(LD) $(LDFLAGS) $< -o $@

hello_world_while_ecx: hello_world_while_ecx.o
	$(LD) $(LDFLAGS) $< -o $@

hello_world_while.o: hello_world_while.asm
	$(AS) -felf $<

hello_world_while_ecx.o: hello_world_while_ecx.asm
	$(AS) -felf $<

clean:
	rm -rf hello_world_while*.o hello_world_while hello_world_while_ecx
