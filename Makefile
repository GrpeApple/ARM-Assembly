# To anyone reading this Makefile, good luck.

# Source Directory
SD=src
# Build Directory
BUD=build
# Binary Directory
BID=bin

E : $(SD)/E.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/E.o $(SD)/E.S
	ld -o $(BID)/E $(BUD)/E.o
arguments : $(SD)/arguments.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/arguments.o $(SD)/arguments.S
	ld -o $(BID)/arguments $(BUD)/arguments.o
bitwise_shift : $(SD)/bitwise_shift.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S
	ld -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o
fork : $(SD)/fork.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/fork.o $(SD)/fork.S
	ld -o $(BID)/fork $(BUD)/fork.o
haha_ARM : $(SD)/haha_ARM.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S
	ld -o $(BID)/haha_ARM $(BUD)/haha_ARM.o
looping : $(SD)/looping.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/looping.o $(SD)/looping.S
	ld -o $(BID)/looping $(BUD)/looping.o
mkdir -p : $(SD)/mkdir.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/mkdir -p.o $(SD)/mkdir.S
	ld -o $(BID)/mkdir -p $(BUD)/mkdir.o
no : $(SD)/no.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/no.o $(SD)/no.S
	ld -o $(BID)/no $(BUD)/no.o
rm : $(SD)/rm.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/rm.o $(SD)/rm.S
	ld -o $(BID)/rm $(BUD)/rm.o
rmdir : $(SD)/rmdir.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/rmdir.o $(SD)/rmdir.S
	ld -o $(BID)/rmdir $(BUD)/rmdir.o
uppercase : $(SD)/uppercase.S
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/uppercase.o $(SD)/uppercase.S
	ld -o $(BID)/uppercase $(BUD)/uppercase.o
.PHONY: all
all:
	mkdir -p $(BUD) $(BID)
	as -o $(BUD)/E.o $(SD)/E.S
	as -o $(BUD)/arguments.o $(SD)/arguments.S
	as -o $(BUD)/bitwise_shift.o $(SD)/bitwise_shift.S
	as -o $(BUD)/fork.o $(SD)/fork.S
	as -o $(BUD)/haha_ARM.o $(SD)/haha_ARM.S
	as -o $(BUD)/looping.o $(SD)/looping.S
	as -o $(BUD)/mkdir -p.o $(SD)/mkdir.S
	as -o $(BUD)/no.o $(SD)/no.S
	as -o $(BUD)/rm.o $(SD)/rm.S
	as -o $(BUD)/rmdir.o $(SD)/rmdir.S
	as -o $(BUD)/uppercase.o $(SD)/uppercase.S
	ld -o $(BID)/E $(BUD)/E.o
	ld -o $(BID)/arguments $(BUD)/arguments.o
	ld -o $(BID)/bitwise_shift $(BUD)/bitwise_shift.o
	ld -o $(BID)/fork $(BUD)/fork.o
	ld -o $(BID)/haha_ARM $(BUD)/haha_ARM.o
	ld -o $(BID)/looping $(BUD)/looping.o
	ld -o $(BID)/mkdir -p $(BUD)/mkdir.o
	ld -o $(BID)/no $(BUD)/no.o
	ld -o $(BID)/rm $(BUD)/rm.o
	ld -o $(BID)/rmdir $(BUD)/rmdir.o
	ld -o $(BID)/uppercase $(BUD)/uppercase.o
.PHONY: clean
clean:
	rm -rf $(BUD)
.PHONY: cleanall
cleanall:
	rm -rf $(BUD) $(BID)
