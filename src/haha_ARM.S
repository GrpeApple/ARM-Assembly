.section .data
	string: .ascii "haha, ARM.\n"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout
		ldr r1, =string
		mov r2, #11 // length
		swi 0 // execute syscall

	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall

