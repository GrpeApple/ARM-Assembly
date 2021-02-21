.section .data
	string:
	.ascii "haha, ARM.\n" // length is 11

.global _start
.section .text

_start:
	mov r7, #0x04 // write syscall
	mov r0, #1 // stdout
	ldr r1, =string
	mov r2, #11

	swi 0 // write to stdout

	mov r7, #0x01 // exit syscall
	mov r0, #0
	swi 0 // exit

