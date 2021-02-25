.section .text
	
	.global _start
	_start:
		mov r7, #0x01 // exit syscall
		ldr r0, [sp] // argument
		swi 0 // execute syscall
