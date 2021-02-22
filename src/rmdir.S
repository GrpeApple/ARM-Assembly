.data
	dir:
		.asciz "rm_this_dir"
.global _start
.text
_start:
	mov r7, #0x28 // rmdir syscall
	ldr r0, =dir
	swi 0 // remove directory
