// for (int r3 = 0, int r3 = 1; r3 <= 9; ++r3)
.syntax unified

.section .data
	for_string: .ascii "Loop"

.section .text

	.global _start
	_start:
		mov r3, #0x00
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =for_string
		mov r2, #0x04 // length
		
		b _loop // goto label _loop

	_loop:
		swi 0x00 // execute syscall

		add r3, #0x01
		cmp r3, #0x09
		ble _loop

	_end:
		// r0 = 10
		mov r7, #0x01 // exit syscall
		mov r0, r3 // exit status
		swi 0x00 // execute syscall
