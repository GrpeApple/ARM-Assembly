.section .data
	string: .asciz "Hello, World!"

.section .text

	.global main
	main:
		stp x24, x30, [sp, #-0x10]! // 16; link register

		ldr x0, =string
		bl puts

		ldp x24, x30, [sp], #0x10 // 16; link register
		ret // return from link register
