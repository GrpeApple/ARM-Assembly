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
### Source code extension
SOURCEEXT:=.S
### AS ouptut extension binary
ASEXT:=.o
### LD output extension binary
####EXT=.bin
LDEXT:=
### Sources
PROGRAM:=$(shell find src -type f -iname "*.S" -print | tr -d ".S" | sed 's/.*\///')


$(PROGRAM): %: $(SD)/%$(SOURCEEXT)
	$(MKDIR) $(BUD) $(BID)
	$(eval ASSOURCE:=$<)
	$(eval ASOUTPUT:=$(BUD)/$@$(ASEXT))
	$(eval LDSOURCE:=$(BUD)/$@$(ASEXT))
	$(eval LDOUTPUT:=$(BID)/$@$(LDEXT))
ifdef $(AS)
	$(LD) $(LDFLAGS) -o $(BID)/$@$(EXT) $(LDSOURCE)
else ifdef $(LD)
	$(AS) $(ASFLAGS) -o $(BUD)/$@$(ASEXT) $(ASSOURCE)
else
	$(AS) $(ASFLAGS) -o $(BUD)/$@$(ASEXT) $(ASSOURCE)
	$(LD) $(LDFLAGS) -o $(BID)/$@$(EXT) $(LDSOURCE)
endif
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
