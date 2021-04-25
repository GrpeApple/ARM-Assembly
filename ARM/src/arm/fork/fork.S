/*
	Depends on: flush.S
*/

.code 32 // arm
.syntax unified

.section .data
	/* I spent my time making the length fit. (Including this comment.) */
	.balign 0x10 // 16
	confirm: .asciz "Do you want to continue? (y/N): "
	.balign 0x10 // 16
	confirm1: .asciz "Are you sure about this? (y/N): "
	.balign 0x10 // 16
	confirm2: .asciz "Final warning.....\nAre you absolutely sure? (Yes, please fork): "
	.balign 0x01
	confirm_string: .asciz "y"
	.balign 0x08
	confirm2_string: .asciz "Yes, please fork"
	.balign 0x08
	exit: .asciz "Great decision.\n"
	.balign 0x10 // 16
	fork: .asciz "Initializing fork bomb.........\n"

.section .bss
	.balign 0x08
	input: .space 0x10 // 16

.section .text

	.global _start
	_start:
		mov r8, #0x00 // confirm, confirm1, confirm2
		mov r9, #0x00 // confirm..confirm1, length
		ldr r3, =input

	_check_fork:
		cmp r8, #0x03 // End of confirmations?
		beq _fork_init

	_write:
		bl _change_write
		swi #0x00 // execute syscall


	_read:
		bl _change_read
		swi #0x00 // execute syscall


	_check:
		bl _change_check

		ldr r5, [r3] // input

		cmp r8, #0x02 // confirm2
		beq _check_confirm2

		cmp r5, #0x0a // 10; '\n'
		beq _loop


			_check_confirm:
				cmp r1, r2 // input, confirm_string
				bicne r2, #0x20 // 32; Uppercase confirm..confirm1_string
				cmpne r1, r2
				moveq r9, #0x01 // confirm..confirm1
				beq _loop_check

				bne _end

			_check_confirm2:
				cmp r9, #0x10 // 16
				beq _loop

				ldr r1, [r3] // input
				ldrb r2, [r4, r9] // confirm2_string_character <- confirm2_string[length]
				add r9, #0x01 // length++
				cmp r1, r2
				bne _end

			_loop_check:
				b _read

	_loop:
		cmp r9, #0x00 // not confirm
		movne r9, #0x00 // length
		addne r8, #0x01 // confirm++
		bne _check_fork

	_end:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall

		mov r0, r3 // input address
		blne flush

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall


	_fork_init:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =fork
		mov r2, #0x20 // 32; length
		swi #0x00 // execute syscall

		mov r7, #0x02 // fork syscall

	_fork:
		swi #0x00 // execute syscall

		b _fork

	_change_write:
		push {lr}

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor

		cmp r8, #0x00 // confirm
		ldreq r1, =confirm

		cmp r8, #0x01 // confirm1
		ldreq r1, =confirm1

		cmp r8, #0x02 // confirm2
		ldreq r1, =confirm2
		moveq r2, #0x40 // 64; length

		movlt r2, #0x20 // 32; length

		pop {pc}

	_change_read:
		push {lr}

		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =input
		mov r2, #0x01 // length

		pop {pc}

	_change_check:
		push {lr}

		cmp r8, #0x02 // confirm2
		ldreq r4, =confirm2_string

		ldrlt r2, =confirm_string
		movlt r1, r3 // input address
		ldrlt r2, [r2] // confirm_string
		ldrlt r1, [r1] // input

		pop {pc}
