.section .data
	file: .asciz "file"

.section .text

	.global _start
	_start:
		mov r7, #0x0a // 10; unlink syscall, aka remove files
		ldr r0, =file
		swi 0x00 // execute syscall
	
	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
