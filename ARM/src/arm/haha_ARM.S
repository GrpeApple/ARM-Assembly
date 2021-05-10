.code 32 // arm
.syntax unified

.section .data

	.balign 0x08
	string: .asciz "haha, ARM.\n"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =string
		mov r2, #0x0b // 11; length
		swi #0x00 // execute syscall


	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
