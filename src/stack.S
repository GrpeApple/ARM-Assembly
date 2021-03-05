.section .text

	.global _start
	_start:
		mov r1, #0x3c // 60
		mov r2, #0x09
		STMFD SP!, {r0, r1, r2} // Decrement before
		mov r1, #0x28 // 40
		mov r2, #0x02
		add r0, r1, r2
		LDMFD SP!, {r0, r1, r2} // Increment after
		add r0, r1, r2
	_end:
		mov r7, #0x01 // exit syscall
		swi 0x00 // execute syscall
