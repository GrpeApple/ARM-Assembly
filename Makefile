# To anyone reading this Makefile, good luck.

# Phony
.PHONY: all debugall runall clean cleanall 

# Variables
## Commands
### Assembler, change this if you are on another platform
AS=as
### Linker, change this if you are on another platform
LD=ld
### C Compiler, if empty use gcc
CC?=gcc
### Create directories
MKDIR=mkdir -p
### Remove
RM=rm -rf

## Directories
### Source Directory
SD=src
### Build Directory
BUD=build
### Binary Directory
BID=bin

## Flags
### Assembler Flags
ASFLAGS:=
### Linker Flags
LDFLAGS:=
### C Flags
CFLAGS:=

## Other
### File extension
####EXT=.bin
EXT=
### Sources
PROGRAM:=$(shell find src -type f -iname "*.S" -print | tr -d ".S" | sed 's/.*\///')

$(PROGRAM): %: $(SD)/%.S
	mkdir -p $(BUD) $(BID)
	$(AS) $(ASFLAGS) -o $(BUD)/$@.o $<
	$(LD) $(LDFLAGS) -o $(BID)/$@$(EXT) $(BUD)/$@.o
all: $(PROGRAM)
debugall: debug $(PROGRAM)
debug:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
debugall: $(PROGRAM)
runall: # do not do with dangerous programs
	$(BID)/*
clean:
	$(RM) $(BUD)
cleanall:
	$(RM) $(BUD) $(BID)
