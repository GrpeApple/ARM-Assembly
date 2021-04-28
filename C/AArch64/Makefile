# Phony
.PHONY: help
.PHONY: debug
.PHONY: all debugall runall clean cleanall

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


### C Compiler
####CC=aarch64-linux-gnu-gcc
CC:=gcc


### C Linker
####CL=aarch64-linux-gnu-gcc
CL:=gcc


### Runner, change this if you are on another platform
####RUN=qemu-aarch64
RUN:=


### Command Line Arguments; this may be passed to the Runner
####ARGS="a b c d e f g h i j k l m n o p q r s t u v w x y z ./*"
ARGS:=


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
CSD:=$(SD)/c



#### C Build Directory
CBUD:=$(BUD)/c



#### C Binary Directory
CBID:=$(BID)/c


## Flags


### C Compiler Flags
####CCFLAGS=-g
CCFLAGS:=


### C Linker Flags
####CLFLAGS=-static
CLFLAGS:=

## Other


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


CPROGRAM:=$(shell find "./$(CSD)" -maxdepth 1 -type f -iname "*$(CSDEXT)" -print | tr -d "$(CSDEXT)" | sed 's|.*/||')
CPROGRAM_DIRS:=$(shell find './$(CSD)' -maxdepth 1 \( -type d -o -type l \) ! -path "./$(CSD)" -print | sed 's|.*/||')
CPROGRAM_DEPS:=$(shell for i in $(CPROGRAM_DIRS); do find "./$(CSD)/$${i}" -maxdepth 1 \( -type f -o -type l \) -iname '*$(CSDEXT)' -print | tr -d '$(CSDEXT)' | sed 's|/$(CSD)/||' | sed "s|$${i}/$${i}||"; done)




help:
	$(info $(HELP_MESSAGE))
	@:


$(CPROGRAM_DIRS): %: $(CSD)/%
	$(eval CCSD:=$</$@$(CSDEXT))
	$(eval CCOUT:=$(CBUD)/$@/$@$(CCEXT))
	$(eval CLOUT:=$(CBID)/$@$(CLEXT))
ifndef CC
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -o $(CLOUT) $(shell echo $(CBUD)/$@/*$(CCEXT))
else ifndef CL
	$(MKDIR) $(CBUD)/$@/
	$(CC) $(CCFLAGS) -c -o $(CCOUT) $(CCSD)
	for i in $(shell echo '$(CPROGRAM_DEPS)' | grep -o '$@\S*'); do $(CC) $(CCFLAGS) -o "$(CBUD)/$${i}$(CCEXT)" "$(CSD)/$${i}$(CSDEXT)"; done
else
	$(MKDIR) $(CBUD)/$@/
	$(CC) $(CCFLAGS) -c -o $(CCOUT) $(CCSD)
	for i in $(shell echo '$(CPROGRAM_DEPS)' | grep -o '$@\S*'); do $(CC) $(CCFLAGS) -o "$(CBUD)/$${i}$(CCEXT)" "$(CSD)/$${i}$(CSDEXT)"; done
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -o $(CLOUT) $(shell echo $(CBUD)/$@/*$(CCEXT))
endif
	@:


$(CPROGRAM): %: $(CSD)/%$(CSDEXT)
	$(eval CCSD:=$<)
	$(eval CCOUT:=$(CBUD)/$@$(CEXT))
	$(eval CLSD:=$(CBUD)/$@$(CEXT))
	$(eval CLOUT:=$(CBID)/$@$(CLEXT))
ifndef CC
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -c -o $(CCOUT) $(CLSD)
else ifndef CL
	$(MKDIR) $(CBUD)
	$(CC) $(CCFLAGS) -o $(CLOUT) $(CCSD)
else
	$(MKDIR) $(CBUD)
	$(CC) $(CCFLAGS) -c -o $(CCOUT) $(CCSD)
	$(MKDIR) $(CBID)
	$(CL) $(CLFLAGS) -o $(CLOUT) $(CLSD)
endif
	@:


all: $(CPROGRAM_DIRS) $(CPROGRAM)


debugall: | debug all


debug:
	$(eval CCFLAGS:=$(CCFLAGS) -g)
	@:


runall:
	@if [ ! -d "./$(CBID)" ]; then \
		echo $(RUN_MESSAGE) $(CBID); \
	else \
		$(RUN) ./$(CBID)/* $(ARGS); \
	fi
	@:


clean:
	$(RM) $(CBUD)
	$(RM) $(BUD)
	@:


cleanall:
	$(RM) $(CBUD) $(CBID)
	$(RM) $(BUD) $(BID)
	@:
