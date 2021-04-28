.code 32 // arm
.syntax unified
.extern printf

.section .data
	.balign 0x08
	string: .asciz "Hello, World!"

.section .text

	.global main
	main:
		push {lr}

		ldr r0, =string
		bl puts

		mov r0, #0x00 // exit status
		pop {pc}
