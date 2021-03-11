.syntax unified
.extern printf

.section .data
	string: .asciz "Hello, World!\n"

.section .text

	.global main
	main:
		push {ip, lr}

		ldr r0, =string
		bl printf

		pop {ip, pc}
