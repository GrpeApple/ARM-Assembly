.section .data
	dir: .asciz "dir"

.section .text

	.global _start
	_start:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =dir
		mov r2, #0x03 // length
		swi 0 // execute syscall
	
	_mkdir:
		mov r7, #0x27 // mkdir syscall
		ldr r0, =dir
		// mov r1, #500 // UNIX permissions
		swi 0x00 // execute syscall
	
	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
