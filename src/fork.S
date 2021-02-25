.section .text
	
	.global _start
	_start:
		mov r7, #0x02 // fork syscall
		swi 0 // execute syscall
		
	loop:
		b _start // goto label _start
