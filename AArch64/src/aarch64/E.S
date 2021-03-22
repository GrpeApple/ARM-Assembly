.section .data
	string: .ascii "E"

.section .text

	.global _start
	_start:
		mov x8, #0x40 // 64; write syscall
		mov x0, #0x01 // stdout file descriptor
		ldr x1, =string
		mov x2, #0x01 // length

	_output: svc #0x00 // execute syscall

	_loop: b _output // goto label _output
