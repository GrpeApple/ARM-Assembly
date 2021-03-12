# To anyone reading this Makefile, good luck.
# But, DO NOT CHANGE ANYTHING HERE. Unless, you know what you are doing; in that case, can you help me?


# Phony
.PHONY: help
.PHONY: all debugall runall clean cleanall
.PHONY: allarm debugallarm runallarm cleanarm cleanallarm
.PHONY: allc debugallc runallc cleanc cleanallc

# Variables

## Message


### Help
define HELP_MESSAGE
Run some targets!
endef


### Directoy does not exist
define RUN_MESSAGE
Nothing to run for
endef

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


#### ARM Source Directory
ASD:=$(SD)/arm



#### ARM Build Directory
ABUD:=$(BUD)/arm



#### ARM Binary Directory
ABID:=$(BID)/arm



#### C Source Directory
CSD:=$(SD)/cc



#### C Build Directory
CBUD:=$(BUD)/cc



#### C Binary Directory
CBID:=$(BID)/cc


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
####ASDEXT=.asm
ASDEXT:=.S


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


PROGRAM:=$(shell find $(ASD) -maxdepth 1 -type f -iname "*$(ASDEXT)" -print | tr -d "$(ASDEXT)" | sed 's/.*\///')


#### CC Sources
CPROGRAM:=$(shell find $(CSD) -maxdepth 1 -type f -iname "*$(CSDEXT)" -print | tr -d "$(CSDEXT)" | sed 's/.*\///')




help:
	$(info $(HELP_MESSAGE))
	@:


$(PROGRAM): %: $(ASD)/%$(ASDEXT)
	$(eval ASSD:=$<)
	$(eval ASOUT:=$(ABUD)/$@$(ASEXT))
	$(eval LDSD:=$(ABUD)/$@$(ASEXT))
	$(eval LDOUT:=$(ABID)/$@$(LDEXT))
ifdef $(AS)
	$(MKDIR) $(ABID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(LDSD)
else ifdef $(LD)
	$(MKDIR) $(ABUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
else
	$(MKDIR) $(ABUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
	$(MKDIR) $(ABID)
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
	@if [ ! -d "./$(ABID)" ]; then echo $(RUN_MESSAGE) $(ABID); else $(RUN) $(ABID)/*; fi
	@if [ ! -d "./$(CBID)" ]; then echo $(RUN_MESSAGE) $(CBID); else $(RUN) $(CBID)/*; fi


clean:
	$(RM) $(ABUD)
	$(RM) $(CBUD)
	$(RM) $(BUD)


cleanall:
	$(RM) $(ABUD) $(ABID)
	$(RM) $(CBUD) $(CBID)
	$(RM) $(BUD) $(BID)



allarm: $(PROGRAM)


debugallarm: debugarm allarm


debugarm:
	$(eval ASFLAGS:=$(ASFLAGS) -g)


debugallarm: allarm


runallarm:
	@if [ ! -d "./$(ABID)" ]; then echo $(RUN_MESSAGE) $(ABID); else $(RUN) $(ABID)/*; fi


cleanarm:
	$(RM) $(ABUD)
	$(RM) $(BUD)


cleanallarm:
	$(RM) $(ABUD) $(ABID)
	$(RM) $(BUD) $(BID)



allc: $(CPROGRAM)


debugallc: debugc allc


debugc:
	$(eval CFLAGS:=$(CFLAGS) -g)


debugallc: allc


runallc:
	@if [ ! -d "./$(CBID)" ]; then echo $(RUN_MESSAGE) $(CBID); else $(RUN) $(CBID)/*; fi


cleanc:
	$(RM) $(CBUD)
	$(RM) $(BUD)


cleanallc:
	$(RM) $(CBUD) $(CBID)
	$(RM) $(BUD) $(BID)
