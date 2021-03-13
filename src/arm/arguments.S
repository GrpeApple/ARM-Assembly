/*
	string* r3 = argv_content
	int r9 = 4;
	int r8 = 0;
	do {
		r9 += 4
		r8 += 4
		// blah blah code //
	}
	while (r2 != 0);
*/
.syntax unified

.section .data
	.balign 0x08
	argv_string: .ascii "Argument Value: "
	.balign 0x02
	separator: .ascii "\n"
	.balign 0x02
	separator_length = . - separator
	argv: .asciz ""

.section .text
	
	.global _start
	_start:
		mov r9, #0x04
		mov r8, #0x00
		ldr r3, argv_content

	_argv:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =argv_string
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall
		
		_loop:
			add r8, #0x04
			add r9, #0x04

			ldr r1, [sp, r8]
			ldr r2, [sp, r9]
		
			push {r2}

			str r1, [r3]
			movne r2, #0x00
			ldr r4, [r3]


		_write_argv:
			mov r7, #0x04 // write syscall
			mov r0, #0x01 // stdout file descriptor
			push {r0}
			ldr r1, =separator
			ldr r2, =separator_length
			swi 0x00 // execute syscall
			
			pop {r0}
			ldr r1, [r3]
			mov r2, #0x00

				_length:
					ldrb r5, [r4, r2]
		
					cmp r5, #0x00 // if terminated
					addne r2, #0x01
					bne _length

			swi 0x00 // execute syscall



			pop {r2}
			cmp r2, #0x00
			bne _loop

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall

	argv_content: .word argv
