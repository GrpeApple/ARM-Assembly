.section .data
	file: .asciz "file"

.section .text

	.global _start
	_start:
		mov r7, #0x0a // unlink syscall, aka remove files
		ldr r0, =file
		swi 0 // execute syscall
	
	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall
