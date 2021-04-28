.section .data
	string: .asciz "Hello, World!"

.section .text

	.global main
	main:
		stp x29, x30, [sp, #-0x10]! // 16; link register

		ldr x0, =string
		bl puts

		ldp x29, x30, [sp], #0x10 // 16; link register
		mov w0, wzr // exit status
		ret // return from link register
