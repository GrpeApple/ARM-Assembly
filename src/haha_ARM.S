.section .data
	string: .ascii "haha, ARM.\n"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout
		ldr r1, =string
		mov r2, #0x0b // 11; length
		swi 0x00 // execute syscall

	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall

