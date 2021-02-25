.section .data
	dir: .asciz "dir"

.section .text
	
	.global _start
	_start:
		mov r7, #0x28 // rmdir syscall
		ldr r0, =dir
		swi 0 // execute syscall
	
	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall
