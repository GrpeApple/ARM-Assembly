/*
	Depends on: int2str.S

	for (int r0 = 0, r3 = 9; r0 <= r3; r0++)
*/

.code 32 // arm
.syntax unified

.section .data
	.balign 0x02
	for_string: .asciz "Loop: "

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =for_string
		mov r2, #0x06 // length
		swi #0x00 // execute syscall

		mov r0, #0x00

	_loop:
		push {r0} // integer

		bl int2str

	_write:
		ldr r0, [sp] // integer
		cmp r0, #0x09

		movle r0, #0x01 // stdout file descriptor
		ldrle r1, =for_string
		movle r2, #0x06 // length
		swile #0x00 // execute syscall


		pople {r0} // integer
		addle r0, #0x01 // integer++
		ble _loop

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
