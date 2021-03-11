# To anyone reading this Makefile, good luck.
# But, DO NOT CHANGE ANYTHING HERE. Unless, you know what you are doing; in that case, can you help me?


# Phony
.PHONY: help
.PHONY: all debugall runall clean cleanall
.PHONY: allarm debugallarm runallarm cleanarm cleanallarm
.PHONY: allc debugallc runallc cleanc cleanallc

help:
	$(info Run some targets!)
	@:

# Variables

## Commands


### Assembler, change this if you are on another platform
####AS=arm-linux-gnueabihf-as
AS:=as


### Linker, change this if you are on another platform
####LD=arm-linux-gnueabihf-ld
LD:=ld


### Runner, change this if you are on another platform
####RUN=qemu-arm
RUN:=


### C Compiler
####CC=arm-linux-gnueabihf-gcc
CC:=gcc


### C Linker
####CL=arm-linux-gnueabihf-gcc
CL:=gcc

### Create directories
MKDIR:=mkdir -p


### Remove
RM:=rm -rf

## Directories


### Source Directory
SD:=src


### Build Directory
BUD:=build


### Binary Directory
BID:=bin


#### C Source Directory
CSD:=src/cc


### C Build Directory
CBUD:=build/cc


#### C Binary Directory
CBID:=bin/cc

## Flags


### Assembler Flags
ASFLAGS:=


### Linker Flags
LDFLAGS:=


### C Compiler Flags
####CCFLAGS=-g
CCFLAGS:=


### C Linker Flags
####CLFLAGS=-static
CLFLAGS:=

## Other


### Source code extension
####SDEXT=.asm
SDEXT:=.S


### AS ouptut extension binary
####ASEXT=.obj
ASEXT:=.o


### LD output extension binary
####LDEXT=.bin
LDEXT:=


### C Compiler Source code extension
####CSDEXT=.asm
CSDEXT:=.S


### C Linker Source code extension
####CSDEXT=.asm
CSDEXT:=.S


### CC output extension binary
####CEXT=.obj
CEXT:=.o


### CC link output extension binary
####CLEXT=.bin
CLEXT:=

### Sources


PROGRAM:=$(shell find $(SD) -maxdepth 1 -type f -iname "*$(SDEXT)" -print | tr -d "$(SDEXT)" | sed 's/.*\///')


#### CC Sources
CPROGRAM:=$(shell find $(CSD) -maxdepth 1 -type f -iname "*$(CSDEXT)" -print | tr -d "$(CSDEXT)" | sed 's/.*\///')


$(PROGRAM): %: $(SD)/%$(SDEXT)
	$(eval ASSD:=$<)
	$(eval ASOUT:=$(BUD)/$@$(ASEXT))
	$(eval LDSD:=$(BUD)/$@$(ASEXT))
	$(eval LDOUT:=$(BID)/$@$(LDEXT))
ifdef $(AS)
	$(MKDIR) $(BID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(LDSD)
else ifdef $(LD)
	$(MKDIR) $(BUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
else
	$(MKDIR) $(BUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
	$(MKDIR) $(BID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(LDSD)
endif


$(CPROGRAM): %: $(CSD)/%$(CSDEXT)
	$(eval CCSD:=$<)
	$(eval CCOUT:=$(CBUD)/$@$(CEXT))
	$(eval CLSD:=$(CBUD)/$@$(CEXT))
	$(eval CLOUT:=$(CBID)/$@$(CLEXT))
ifdef $(CC)
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -o $(CCOUTT) $(CLSD)
else ifdef $(CL)
	$(MKDIR) $(CBUD)
	$(CC) $(CCFLAGS) -o $(CLOUT) $(CCSD)
else
	$(MKDIR) $(CBUD)
	$(CC) $(CCFLAGS) -c -o $(CCOUT) $(CCSD)
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -o $(CLOUT) $(CLSD)
endif
all: $(PROGRAM) $(CPROGRAM)
debugall: debug all 
debug:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
	$(eval CCFLAGS:=$(CCFLAGS) -g)
debugall: all
runall:
	$(RUN) $(BID)/*
	$(RUN) $(CBID)/*
clean:
	$(RM) $(BUD)
	$(RM) $(CBUD)
cleanall:
	$(RM) $(BUD) $(BID)
	$(RM) $(CBUD) $(CBID)

allarm: $(PROGRAM)
debugallarm: debugarm allarm
debugarm:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
debugallarm: allarm
runallarm:
	$(RUN) $(BID)/*
cleanarm:
	$(RM $(BUD)
cleanallarm:
	$(RM) $(BUD) $(BID)

allc: $(CPROGRAM)
debugallc: debugc allc
debugc:
	$(eval CFLAGS:=$(CFLAGS) -g)
debugallc: allc
runallc:
	$(RUN) $(CBID)/*
cleanc:
	$(RM) $(CBUD)
cleanallc:
	$(RM) $(CBUD) $(CBID)
