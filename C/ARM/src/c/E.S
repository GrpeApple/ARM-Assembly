.code 32 // arm
.syntax unified
.extern printf

.section .text

	.global main
	main:
		mov r0, #0x45 // 69; 'E'

	_loop:
		bl putchar
		b _loop
