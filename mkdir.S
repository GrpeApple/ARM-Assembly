.section .data
	directory:
		.asciz "dir"
.global _start
.section .text
_start:
	mov r7, #0x03 // read syscall
	mov r0, #0 // stdin file descriptor
	ldr r1, =directory
	mov r2, #3
	swi 0 // get input

	mov r7, #0x27 // mkdir syscall
	ldr r0, =directory
	mov r1, #500
	swi 0 // create directory

	mov r7, #0x01 // exit syscall
	mov r0, #0
	swi 0 // exit
