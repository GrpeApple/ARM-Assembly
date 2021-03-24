.section .data
	string: .ascii "Hello, World!\n"

.section .text

	.global _start
	_start:
		mov x8, #0x40 // 64; write syscall
		mov x0, #0x01 // stdout file descriptor
		ldr x1, =string
		mov x2, #0x0e // 14; length
		svc #0x00 // execute syscall

	_end:
		mov x8, #0x5d // 93; exit syscall
		mov x0, #0x00 // exit status
		svc #0x00 // execute syscall
