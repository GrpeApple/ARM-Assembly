.syntax unified

.section .text

	.global _start
	_start:
		mov r1, #0x3c // 60
		mov r2, #0x09
		push {r0-r2}
		mov r1, #0x28 // 40
		mov r2, #0x02
		add r0, r1, r2
		pop {r0-r2}
		add r0, r1, r2

	_end:
		mov r7, #0x01 // exit syscall
		swi 0x00 // execute syscall
