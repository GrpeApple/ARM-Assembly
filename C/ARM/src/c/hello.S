.syntax unified
.extern printf

.section .data
	.balign 0x08
	string: .asciz "Hello, World!\n"

.section .text

	.global main
	main:
		ldr r0, =string
		bl printf

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
