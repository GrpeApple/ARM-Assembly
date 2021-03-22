# To anyone reading this Makefile, good luck.
# But, DO NOT CHANGE ANYTHING HERE. Unless, you know what you are doing; in that case, can you help me?


# Phony
.PHONY: help
.PHONY: debug debugaarch64 debugc
.PHONY: all debugall runall clean cleanall
.PHONY: allaarch64 debugallaarch64 runallaarch64 cleanaarch64 cleanallaarch64
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
####AS=aarch64-linux-gnu-as
AS:=as


### Linker, change this if you are on another platform
####LD=aarch64-linux-gnu-ld
LD:=ld


### Runner, change this if you are on another platform
####RUN=qemu-aarch64
RUN:=


### Command Line Arguments; this may be passed to the Runner
####ARGS="a b c d e f g h i j k l m n o p q r s t u v w x y z ./*"
ARGS:=


### C Compiler
####CC=aarch64-linux-gnu-gcc
CC:=gcc


### C Linker
####CL=aarch64-linux-gnu-gcc
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
ASD:=$(SD)/aarch64



#### ARM Build Directory
ABUD:=$(BUD)/aarch64



#### ARM Binary Directory
ABID:=$(BID)/aarch64



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


PROGRAM:=$(shell find './$(ASD)' -maxdepth 1 -type f -iname '*$(ASDEXT)' -print | tr -d '$(ASDEXT)' | sed 's|.*/||')

#### CC Sources
CPROGRAM:=$(shell find "./$(CSD)" -maxdepth 1 -type f -iname "*$(CSDEXT)" -print | tr -d "$(CSDEXT)" | sed 's|.*/||')




help:
	$(info $(HELP_MESSAGE))
	@:


(PROGRAM): %: $(ASD)/%$(ASDEXT)
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


debugall: | debug all


debug:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
	$(eval CCFLAGS:=$(CCFLAGS) -g)
	@:


runall:
	@if [ ! -d "./$(ABID)" ]; then \
		echo $(RUN_MESSAGE) $(ABID); \
	else \
		$(RUN) ./$(ABID)/* $(ARGS); \
	fi
	@if [ ! -d "./$(CBID)" ]; then \
		echo $(RUN_MESSAGE) $(CBID); \
	else \
		$(RUN) ./$(CBID)/* $(ARGS); \
	fi


clean:
	$(RM) $(ABUD)
	$(RM) $(CBUD)
	$(RM) $(BUD)


cleanall:
	$(RM) $(ABUD) $(ABID)
	$(RM) $(CBUD) $(CBID)
	$(RM) $(BUD) $(BID)



allaarch64: $(PROGRAM)


debugallaarch64: | debugaarch64 allaarch64


debugaarch64:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
	@:


runallaarch64:
	@if [ ! -d "./$(ABID)" ]; then \
		echo $(RUN_MESSAGE) $(ABID); \
	else \
		$(RUN) ./$(ABID)/* $(ARGS); \
	fi


cleanaarch64:
	$(RM) $(ABUD)


cleanallaarch64:
	$(RM) $(ABUD) $(ABID)



allc: $(CPROGRAM)


debugallc: | debugc allc


debugc:
	$(eval CFLAGS:=$(CFLAGS) -g)
	@:


runallc:
	@if [ ! -d "./$(CBID)" ]; then \
		echo $(RUN_MESSAGE) $(CBID); \
	else \
		$(RUN) ./$(CBID)/* $(ARGS); \
	fi


cleanc:
	$(RM) $(CBUD)


cleanallc:
	$(RM) $(CBUD) $(CBID)
