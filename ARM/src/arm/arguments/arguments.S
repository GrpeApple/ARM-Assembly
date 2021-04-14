/*
	Depends on: int2str.S
*/

.code 32 // arm
.syntax unified

.section .data
	.balign 0x08
	argv_string: .asciz "Argument Value: "
	.balign 0x08
	argc_string: .asciz "Argument Count: "
	.balign 0x10 // 16
	error_string: .asciz "Error: Unknown.\nTerminating....\n"
	.balign 0x02
	separator: .asciz "\n"
	.balign 0x02
	separator_length = . - separator

.section .text

	.global _start
	_start:
		ldr r4, [sp] // argc
		cmp r4, #0x00 // argc should not be 0
		beq _error
		mov fp, sp
		add fp, #0x04

	_argv:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argv_string
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall


			_argv_write:
				mov r0, #0x01 // stdout file descriptor
				push {r0}

				mov r2, #0x00
				ldr r3, [fp]

					_argv_length:
						ldrb r1, [r3, r2]

						cmp r1, #0x00 // if terminated
						addne r2, #0x01
						bne _argv_length

				ldr r1, [fp]
				swi #0x00 // execute syscall

				pop {r0}
				ldr r1, =separator
				ldr r2, =separator_length
				swi #0x00 // execute syscall

				ldr r0, [fp, #0x04]!
				cmp r0, #0x00
				bne _argv_write

	_argc:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argc_string
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall

		mov r0, r4
		bl int2str

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall


	_error:
		mov r7, #0x04 // write syscall
		mov r0, #0x02 // stderr file descriptor
		ldr r1, =error_string
		mov r2, #0x20 // 32; length
		swi #0x00 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0x01 // exit status
		swi #0x00
