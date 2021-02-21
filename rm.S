.section .data
	file:
		.asciz "rm_this_file"
.global _start
.section .text
_start:
	mov r7, #0x0a // unlink syscall, aka remove files
	ldr r0, =file
	swi 0 // remove

	// exit
	mov r7, #0x01
	mov r0, #0
	swi 0
