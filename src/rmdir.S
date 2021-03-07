.syntax unified

.section .data
	dir: .asciz "dir"

.section .text
	
	.global _start
	_start:
		mov r7, #0x28 // 40; rmdir syscall
		ldr r0, =dir
		swi 0x00 // execute syscall
	
	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
