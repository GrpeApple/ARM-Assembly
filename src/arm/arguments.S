.syntax unified

.section .text
	
	.global _start
	_start:
		mov r7, #0x01 // exit syscall
		ldr r0, [sp] // argument
		swi 0x00 // execute syscall
