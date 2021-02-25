.section .data
	string: .ascii "no"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =string
		mov r2, #2 // length
		swi 0 // execute syscall

	_loop:
		b _start // goto label _start
