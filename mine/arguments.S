.global _start
.text
_start:
	mov r7, #0x01 // exit syscall
	ldr r0, [sp]
	swi 0 // exit
