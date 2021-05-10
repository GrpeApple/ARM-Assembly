.code 32 // arm
.syntax unified

.section .data

	.balign 0x01
	string: .asciz "E"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =string
		mov r2, #0x01 // length

	_output: swi #0x00 // execute syscall

	_loop: b _output
