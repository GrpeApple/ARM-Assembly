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
		mov fp, sp // fp <- argc
		add fp, #0x04 // *argv[] <- &argc + 4

	_argv:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argv_string
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall


			_argv_write:
				mov r0, #0x01 // stdout file descriptor

				push {r0} // stdout

				mov r2, #0x00 // length
				ldr r3, [fp] // arg <- argv[argc]

					_argv_length:
						ldrb r1, [r3, r2] // char <- (argv[argc])[length]

						cmp r1, #0x00 // terminated?
						addne r2, #0x01 // length++
						bne _argv_length

				mov r1, r3 // argv[argc]
				swi #0x00 // execute syscall


				pop {r0} // stdout

				ldr r1, =separator
				ldr r2, =separator_length
				swi #0x00 // execute syscall

				ldr r0, [fp, #0x04]! // arg = argv[argc + 4]
				cmp r0, #0x00 // End of argv?
				bne _argv_write

	_argc:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argc_string
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall

		ldr r0, [sp] // argc <- sp
		cmp r0, #0x00 // Should NOT happen
		beq _error

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
		swi #0x00 // execute syscall
