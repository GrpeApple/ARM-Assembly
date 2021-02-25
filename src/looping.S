// for (int r0 = 0; r0 <= 9; r0 = r0 + 1)
.section .text

	.global _start
	_start:
		mov r0, #0
		mov r1, #1
		b _loop // goto label _loop

	_loop:
		add r0, r1
		cmp r0, #9
		ble _loop // goto label _loop if less than or equal

	end:
		// r0 = 10
		mov r7, #0x01 // exit syscall
		swi 0 // execute syscall
