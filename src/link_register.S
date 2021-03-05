.section .data
	.balign 0x08
	string: .ascii "abcdefgh"
	.balign 0x04
	link: .word 0

.section .text
	
	.global _start
	_start:
		bl _output
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall

	_output:
		ldr r3, link_content
		str lr, [r3]


		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =string
		mov r2, #0x08 // length
		swi 0x00 // execute syscall


		ldr lr, link_content
		ldr lr, [lr]
		bx lr


	.balign 0x04
	link_content: .word link
