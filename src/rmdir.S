.data
	dir:
		.asciz "dir"
.global _start
.text
_start:
	mov r7, #0x28 // rmdir syscall
	ldr r0, =dir
	swi 0 // remove directory

	mov r7, #0x01 // exit syscall
	mov r0, #0
	swi 0 // exit
