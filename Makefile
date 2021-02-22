# To anyone reading this Makefile, good luck.

# Assembler, change this if you are on another platform
AS=as
# Linker, change this if you are on another platform
LD=ld
# Source Directory
SD=src
# Build Directory
BUD=build
# Binary Directory
BID=bin

E : $(SD)/E.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/E.o $(SD)/E.S
	$(LD) -o $(BID)/E $(BUD)/E.o
arguments : $(SD)/arguments.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/arguments.o $(SD)/arguments.S
	$(LD) -o $(BID)/arguments $(BUD)/arguments.o
bitwise_shift : $(SD)/bitwise_shift.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S
	$(LD) -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o
fork : $(SD)/fork.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/fork.o $(SD)/fork.S
	$(LD) -o $(BID)/fork $(BUD)/fork.o
haha_ARM : $(SD)/haha_ARM.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S
	$(LD) -o $(BID)/haha_ARM $(BUD)/haha_ARM.o
looping : $(SD)/looping.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/looping.o $(SD)/looping.S
	$(LD) -o $(BID)/looping $(BUD)/looping.o
mkdir -p : $(SD)/mkdir.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/mkdir.o $(SD)/mkdir.S
	$(LD) -o $(BID)/mkdir $(BUD)/mkdir.o
no : $(SD)/no.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/no.o $(SD)/no.S
	$(LD) -o $(BID)/no $(BUD)/no.o
rm : $(SD)/rm.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/rm.o $(SD)/rm.S
	$(LD) -o $(BID)/rm $(BUD)/rm.o
rmdir : $(SD)/rmdir.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/rmdir.o $(SD)/rmdir.S
	$(LD) -o $(BID)/rmdir $(BUD)/rmdir.o
upperc$(AS)e : $(SD)/uppercase.S
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/uppercase.o $(SD)/uppercase.S
	$(LD) -o $(BID)/uppercase $(BUD)/uppercase.o
.PHONY: all
all:
	mkdir -p $(BUD) $(BID)
	$(AS) -o $(BUD)/E.o $(SD)/E.S
	$(AS) -o $(BUD)/arguments.o $(SD)/arguments.S
	$(AS) -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S
	$(AS) -o $(BUD)/fork.o $(SD)/fork.S
	$(AS) -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S
	$(AS) -o $(BUD)/looping.o $(SD)/looping.S
	$(AS) -o $(BUD)/mkdir.o $(SD)/mkdir.S
	$(AS) -o $(BUD)/no.o $(SD)/no.S
	$(AS) -o $(BUD)/rm.o $(SD)/rm.S
	$(AS) -o $(BUD)/rmdir.o $(SD)/rmdir.S
	$(AS) -o $(BUD)/uppercase.o $(SD)/uppercase.S
	$(LD) -o $(BID)/E $(BUD)/E.o
	$(LD) -o $(BID)/arguments $(BUD)/arguments.o
	$(LD) -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o
	$(LD) -o $(BID)/fork $(BUD)/fork.o
	$(LD) -o $(BID)/haha_ARM $(BUD)/haha_ARM.o
	$(LD) -o $(BID)/looping $(BUD)/looping.o
	$(LD) -o $(BID)/mkdir $(BUD)/mkdir.o
	$(LD) -o $(BID)/no $(BUD)/no.o
	$(LD) -o $(BID)/rm $(BUD)/rm.o
	$(LD) -o $(BID)/rmdir $(BUD)/rmdir.o
	$(LD) -o $(BID)/uppercase $(BUD)/uppercase.o
.PHONY: clean
clean:
	rm -rf $(BUD)
.PHONY: cleanall
cleanall:
	rm -rf $(BUD) $(BID)
