.section .text
	
	.global _start
	_start:
		mov r1, #1 // the number to operate on
		mov r2, #7 // the number of shifts
		mov r0, r1, lsl r2 // exit status

	end:
		mov r7, #0x01 // exit syscall
		swi 0 // execute syscall
