/*
	Depends on: int2str.S
*/

.code 32 // arm
.syntax unified

.section .text

	.global _start
	_start:
		mov r1, #0x01 // the number to operate on
		mov r2, #0x1e // the number of shifts
		mov r0, r1, lsl r2

		bl int2str

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
