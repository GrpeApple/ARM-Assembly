.section .data
	no:
		.ascii "no"
.global _start
.section .text
_start:
	mov r7, #0x04 // write syscall
	mov r0, #1 // stdout
	ldr r1, =no
	mov r2, #2 // length
	swi 0
	b _start // goto label _start
