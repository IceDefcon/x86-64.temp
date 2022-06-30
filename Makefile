TARGET 		= asmlink
CC  		= g++
ASM 		= nasm 
AFLAGS 		= -f elf64
CFLAGS 		= -m64
ASM_OBJECTS	= src/link.o
LDSCRIPT    = linker/linker.ld

SRCS=\
    src/main.cpp \

SRCS_ASM=\
	src/link.asm \

INCLUDES=\
    -Iinclude

all: link main

main:
	$(CC) $(SRCS) $(CFLAGS) $(INCLUDES) $(ASM_OBJECTS) -T $(LDSCRIPT) -o $(TARGET)

link:
	$(ASM) $(AFLAGS) $(SRCS_ASM)

clean:
	rm $(TARGET) $(ASM_OBJECTS)