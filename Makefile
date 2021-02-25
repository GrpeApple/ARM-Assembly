# To anyone reading this Makefile, good luck.

# Assembler, change this if you are on another platform
AS=as
# Linker, change this if you are on another platform
LD=ld
# Assembler Flags
AS_FLAGS=
# Linker Flags
LD_FLAGS=
# Source Directory
SD=src
# Build Directory
BUD=build
# Binary Directory
BID=bin

E : $(SD)/E.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/E.o $(SD)/E.S $(AS_FLAGS)
	$(LD) -o $(BID)/E $(BUD)/E.o $(LD_FLAGS)
arguments : $(SD)/arguments.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/arguments.o $(SD)/arguments.S $(AS_FLAGS)
	$(LD) -o $(BID)/arguments $(BUD)/arguments.o $(LD_FLAGS)
bitwise_shift : $(SD)/bitwise_shift.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S $(AS_FLAGS)
	$(LD) -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o $(LD_FLAGS)
fork : $(SD)/fork.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/fork.o $(SD)/fork.S $(AS_FLAGS)
	$(LD) -o $(BID)/fork $(BUD)/fork.o $(LD_FLAGS)
haha_ARM : $(SD)/haha_ARM.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S $(AS_FLAGS)
	$(LD) -o $(BID)/haha_ARM $(BUD)/haha_ARM.o $(LD_FLAGS)
looping : $(SD)/looping.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/looping.o $(SD)/looping.S $(AS_FLAGS)
	$(LD) -o $(BID)/looping $(BUD)/looping.o $(LD_FLAGS)
mkdir -p : $(SD)/mkdir.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/mkdir.o $(SD)/mkdir.S $(AS_FLAGS)
	$(LD) -o $(BID)/mkdir $(BUD)/mkdir.o $(LD_FLAGS)
no : $(SD)/no.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/no.o $(SD)/no.S $(AS_FLAGS)
	$(LD) -o $(BID)/no $(BUD)/no.o $(LD_FLAGS)
rm : $(SD)/rm.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/rm.o $(SD)/rm.S $(AS_FLAGS)
	$(LD) -o $(BID)/rm $(BUD)/rm.o $(LD_FLAGS)
rmdir : $(SD)/rmdir.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/rmdir.o $(SD)/rmdir.S $(AS_FLAGS)
	$(LD) -o $(BID)/rmdir $(BUD)/rmdir.o $(LD_FLAGS)
uppercase : $(SD)/uppercase.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/uppercase.o $(SD)/uppercase.S $(AS_FLAGS)
	$(LD) -o $(BID)/uppercase $(BUD)/uppercase.o $(LD_FLAGS)
.PHONY: all
all:
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/E.o $(SD)/E.S $(AS_FLAGS)
	$(AS) -o $(BUD)/arguments.o $(SD)/arguments.S $(AS_FLAGS)
	$(AS) -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S $(AS_FLAGS)
	$(AS) -o $(BUD)/fork.o $(SD)/fork.S $(AS_FLAGS)
	$(AS) -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S $(AS_FLAGS)
	$(AS) -o $(BUD)/looping.o $(SD)/looping.S $(AS_FLAGS)
	$(AS) -o $(BUD)/mkdir.o $(SD)/mkdir.S $(AS_FLAGS)
	$(AS) -o $(BUD)/no.o $(SD)/no.S $(AS_FLAGS)
	$(AS) -o $(BUD)/rm.o $(SD)/rm.S $(AS_FLAGS)
	$(AS) -o $(BUD)/rmdir.o $(SD)/rmdir.S $(AS_FLAGS)
	$(AS) -o $(BUD)/uppercase.o $(SD)/uppercase.S $(AS_FLAGS)
	$(LD) -o $(BID)/E $(BUD)/E.o $(LD_FLAGS)
	$(LD) -o $(BID)/arguments $(BUD)/arguments.o $(LD_FLAGS)
	$(LD) -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o $(LD_FLAGS)
	$(LD) -o $(BID)/fork $(BUD)/fork.o $(LD_FLAGS)
	$(LD) -o $(BID)/haha_ARM $(BUD)/haha_ARM.o $(LD_FLAGS)
	$(LD) -o $(BID)/looping $(BUD)/looping.o $(LD_FLAGS)
	$(LD) -o $(BID)/mkdir $(BUD)/mkdir.o $(LD_FLAGS)
	$(LD) -o $(BID)/no $(BUD)/no.o $(LD_FLAGS)
	$(LD) -o $(BID)/rm $(BUD)/rm.o $(LD_FLAGS)
	$(LD) -o $(BID)/rmdir $(BUD)/rmdir.o $(LD_FLAGS)
	$(LD) -o $(BID)/uppercase $(BUD)/uppercase.o $(LD_FLAGS)
.PHONY: debugall
debugall: # enable -g option
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/E.o $(SD)/E.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/arguments.o $(SD)/arguments.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/fork.o $(SD)/fork.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/looping.o $(SD)/looping.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/mkdir.o $(SD)/mkdir.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/no.o $(SD)/no.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/rm.o $(SD)/rm.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/rmdir.o $(SD)/rmdir.S -g $(AS_FLAGS)
	$(AS) -o $(BUD)/uppercase.o $(SD)/uppercase.S -g $(AS_FLAGS)
	$(LD) -o $(BID)/E $(BUD)/E.o $(LD_FLAGS)
	$(LD) -o $(BID)/arguments $(BUD)/arguments.o $(LD_FLAGS)
	$(LD) -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o $(LD_FLAGS)
	$(LD) -o $(BID)/fork $(BUD)/fork.o $(LD_FLAGS)
	$(LD) -o $(BID)/haha_ARM $(BUD)/haha_ARM.o $(LD_FLAGS)
	$(LD) -o $(BID)/looping $(BUD)/looping.o $(LD_FLAGS)
	$(LD) -o $(BID)/mkdir $(BUD)/mkdir.o $(LD_FLAGS)
	$(LD) -o $(BID)/no $(BUD)/no.o $(LD_FLAGS)
	$(LD) -o $(BID)/rm $(BUD)/rm.o $(LD_FLAGS)
	$(LD) -o $(BID)/rmdir $(BUD)/rmdir.o $(LD_FLAGS)
	$(LD) -o $(BID)/uppercase $(BUD)/uppercase.o $(LD_FLAGS)
.PHONY: clean
clean:
	rm -rf $(BUD)
.PHONY: cleanall
cleanall:
	rm -rf $(BUD) $(BID)
