.section .data
	string: .ascii "no"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =string
		mov r2, #0x02 // length
		swi 0x00 // execute syscall

	_loop:
		b _start // goto label _start
