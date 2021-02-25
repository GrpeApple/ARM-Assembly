.section .data
	dir: .asciz "dir"

.section .text

	.global _start
	_start:
		mov r7, #0x03 // read syscall
		mov r0, #0 // stdin file descriptor
		ldr r1, =dir
		mov r2, #3 // length
		swi 0 // execute syscall
	
	_mkdir:
		mov r7, #0x27 // mkdir syscall
		ldr r0, =directory
		mov r1, #500 // UNIX permissions
		swi 0 // execute syscall
	
	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall
