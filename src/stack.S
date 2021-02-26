.section .text

	.global _start
	_start:
		mov r1, #60
		mov r2, #9
		STMFD SP!, {r0, r1, r2} // Decrement before
		mov r1, #40
		mov r2, #2
		add r0, r1, r2
		LDMFD SP!, {r0, r1, r2} // Increment after
		add r0, r1, r2
	end:
		mov r7, #0x01 // exit syscall
		swi 0 // execute syscall
