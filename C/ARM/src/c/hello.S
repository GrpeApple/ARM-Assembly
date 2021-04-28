.code 32 // arm
.syntax unified
.extern printf

.section .data
	.balign 0x08
	string: .asciz "Hello, World!\n"

.section .text

	.global main
	main:
		push {lr}

		ldr r0, =string
		bl printf

		pop {pc}
