.syntax unified
.equ division, 0x66666667 // 1717986919; (2 ^ 34 + 6) / 10

.section .data
	.balign 0x08
	argv_string: .ascii "Argument Value: \n"
	.balign 0x08
	argc_string: .ascii "Argument Count: "
	.balign 0x10 // 16
	error_string: .ascii "Error: Unknown.\nTerminating....\n"
	.balign 0x02
	separator: .ascii "\n"
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
		mov r2, #0x11 // 17; length
		swi 0x00 // execute syscall
		

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
				swi 0x00 // execute syscall
				
				pop {r0}
				ldr r1, =separator
				ldr r2, =separator_length
				swi 0x00 // execute syscall

				ldr r0, [fp, #0x04]!
				cmp r0, #0x00
				bne _argv_write
	
	_argc:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argc_string
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall

		push {ip}
		mov r0, r4

			_argc_division:
				/*
					If your architecture is ARMv7 (or above).
					movw r1, #:lower16:division // 26215
					movt r1, #:upper16:division // 26214
				*/
				ldr r1, =division
				smmul r1, r0, r1
				asr r2, r1, #0x02

			_argc_modulo:
				add r1, r2, r1, lsr #0x001f // 31
				add r1, r1, r1, lsl #0x02
				sub r0, r0, r1, lsl #0x01

			_argc_string:
				add r0, #0x30 // r8; 0
				push {r0}

			_argc_shift:
				mov r0, r2
				cmp r0, #0x00
				bne _argc_division

			_argc_write:
				ldr r1, [sp]
				cmp r1, #0x00
				beq _newline
				
				mov r0, #0x01 // stdout file descriptor
				mov r1, sp
				pop {ip}
				mov r2, #0x01 // length
				swi 0x00 // execute syscall

				bne _argc_write

	_newline:
		mov r0, #0x0a // 10; newline
		push {r0}

		mov r0, #0x01 // stdout file descriptor
		mov r1, sp
		pop {ip}
		swi 0x00 // execute syscall

		pop {ip}

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall


	_error:
		mov r7, #0x04 // write syscall
		mov r0, #0x02 // stderr file descriptor
		ldr r1, =error_string
		mov r2, #0x20 // 32; length
		swi 0x00 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0x01 // exit status
		swi 0x00
