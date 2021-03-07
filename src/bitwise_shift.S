.syntax unified

.section .text
	
	.global _start
	_start:
		mov r1, #0x01 // the number to operate on
		mov r2, #0x07 // the number of shifts
		mov r0, r1, lsl r2 // exit status

	_end:
		mov r7, #0x01 // exit syscall
		swi 0x00 // execute syscall
