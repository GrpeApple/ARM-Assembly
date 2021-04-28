# Phony
.PHONY: help debug
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



## Flags


### Assembler Flags
ASFLAGS:=


### Linker Flags
LDFLAGS:=


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


### Sources


PROGRAM:=$(shell find './$(ASD)' -maxdepth 1 \( -type f -o -type l \) -iname '*$(ASDEXT)' -print | tr -d '$(ASDEXT)' | sed 's|.*/||')
PROGRAM_DIRS:=$(shell find './$(ASD)' -maxdepth 1 \( -type d -o -type l \) ! -path "./$(ASD)" -print | sed 's|.*/||')
PROGRAM_DEPS:=$(shell for i in $(PROGRAM_DIRS); do find "./$(ASD)/$${i}" -maxdepth 1 \( -type f -o -type l \) -iname '*$(ASDEXT)' -print | tr -d '$(ASDEXT)' | sed 's|/$(ASD)/||' | sed "s|$${i}/$${i}||"; done)




help:
	$(info $(HELP_MESSAGE))
	@:


$(PROGRAM_DIRS): %: $(ASD)/%
	$(eval ASSD:=$</$@$(ASDEXT))
	$(eval ASOUT:=$(ABUD)/$@/$@$(ASEXT))
	$(eval LDOUT:=$(ABID)/$@$(LDEXT))
ifndef AS
	$(MKDIR) $(ABID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(shell echo $(ABUD)/$@/*$(ASEXT))
else ifndef LD
	$(MKDIR) $(ABUD)/$@/
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
	for i in $(shell echo '$(PROGRAM_DEPS)' | grep -o '$@\S*'); do $(AS) $(ASFLAGS) -o "$(ABUD)/$${i}$(ASEXT)" "$(ASD)/$${i}$(ASDEXT)"; done
else
	$(MKDIR) $(ABUD)/$@/
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
	for i in $(shell echo '$(PROGRAM_DEPS)' | grep -o '$@\S*'); do $(AS) $(ASFLAGS) -o "$(ABUD)/$${i}$(ASEXT)" "$(ASD)/$${i}$(ASDEXT)"; done
	$(MKDIR) $(ABID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(shell echo $(ABUD)/$@/*$(ASEXT))
endif
	@:


$(PROGRAM): %: $(ASD)/%$(ASDEXT)
	$(eval ASSD:=$<)
	$(eval ASOUT:=$(ABUD)/$@$(ASEXT))
	$(eval LDSD:=$(ABUD)/$@$(ASEXT))
	$(eval LDOUT:=$(ABID)/$@$(LDEXT))
ifndef AS
	$(MKDIR) $(ABID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(LDSD)
else ifndef LD
	$(MKDIR) $(ABUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
else
	$(MKDIR) $(ABUD)
	$(AS) $(ASFLAGS) -o $(ASOUT) $(ASSD)
	$(MKDIR) $(ABID)
	$(LD) $(LDFLAGS) -o $(LDOUT) $(LDSD)
endif
	@:


all: $(PROGRAM_DIRS) $(PROGRAM)


debugall: | debug all


debug:
	$(eval ASFLAGS:=$(ASFLAGS) -g)
	@:


runall:
	@if [ ! -d "./$(ABID)" ]; then \
		echo $(RUN_MESSAGE) $(ABID); \
	else \
		$(RUN) ./$(ABID)/* $(ARGS); \
	fi
	@:


clean:
	$(RM) $(ABUD)
	$(RM) $(BUD)
	@:


cleanall:
	$(RM) $(ABUD) $(ABID)
	$(RM) $(BUD) $(BID)
	@:
