.PHONY: help
help:
	@echo "Make something."
E : E.S
	as -o E.o E.S
	ld -o E E.o
arguments : arguments.S
	as -o arguments.o arguments.S
	ld -o arguments arguments.o
bitwise_shift : bitwise_shift.S
	as -o bitwise_shift.o bitwise_shift.S
	ld -o bitwise_shift bitwise_shift.o
cmdline : cmdline.S
	as -o cmdline.o cmdline.S
	ld -o cmdline cmdline.o
fork : fork.S
	as -o fork.o fork.S
	ld -o fork fork.o
haha_ARM : haha_ARM.S
	as -o haha_ARM.o haha_ARM.S
	ld -o haha_ARM haha_ARM.o
hello : hello.S
	as -o hello.o hello.S
	ld -o hello hello.o
looping : looping.S
	as -o looping.o looping.S
	ld -o looping looping.o
mkdir : mkdir.S
	as -o mkdir.o mkdir.S
	ld -o mkdir mkdir.o
no : no.S
	as -o no.o no.S
	ld -o no no.o
rm : rm.S
	as -o rm.o rm.S
	ld -o rm rm.o
uppercase : uppercase.S
	as -o uppercase.o uppercase.S
	ld -o uppercase uppercase.o
.PHONY: all
all:
	@echo "Assembling..."
	as -o E.o E.S
	as -o arguments.o arguments.S
	as -o bitwise_shift.o bitwise_shift.S
	as -o cmdline.o cmdline.S
	as -o fork.o fork.S
	as -o haha_ARM.o haha_ARM.S
	as -o hello.o hello.S
	as -o looping.o looping.S
	as -o mkdir.o mkdir.S
	as -o no.o no.S
	as -o rm.o rm.S
	as -o uppercase.o uppercase.S
	@echo "Linking..."
	ld -o E E.o
	ld -o arguments arguments.o
	ld -o bitwise_shift bitwise_shift.o
	ld -o cmdline cmdline.o
	ld -o fork fork.o
	ld -o haha_ARM haha_ARM.o
	ld -o hello hello.o
	ld -o looping looping.o
	ld -o mkdir mkdir.o
	ld -o no no.o
	ld -o rm rm.o
	ld -o uppercase uppercase.o
	@echo "Done."
.PHONY: clean
clean:
	@echo "Removing assembled files..."
	rm -f *.o
	@echo "Done."
.PHONY: cleanall
cleanall:
	@echo "Removing assembled files..."
	rm -f *.o
	@echo "Removing linked files..."
	rm -f E arguments bitwise_shift cmdline fork haha_ARM hello looping mkdir no rm uppercase
	@echo "Done."
