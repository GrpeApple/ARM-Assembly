/*
	Depends on: flush.S
*/

.code 32 // arm
.syntax unified

.section .data


	/* I spent my time making the length fit. (Including this comment.) */

	.balign 0x10 // 16
	confirm: .ascii "Do you want to continue? (y/N): "

	.balign 0x10 // 16
	confirm1: .ascii "Are you sure about this? (y/N): "

	.balign 0x10 // 16
	confirm2: .ascii "Final warning.....\nAre you absolutely sure? (Yes, please fork): "

	.balign 0x01
	confirm_string: .asciz "y"

	.balign 0x08
	confirm2_string: .asciz "Yes, please fork"

	.balign 0x08
	exit: .ascii "Great decision.\n"

	.balign 0x10 // 16
	fork: .ascii "Initializing fork bomb.........\n"

.section .bss
	.balign 0x08
	input: .space 0x10 // 16

.section .text

	.global _start
	_start:
		mov r8, #0x00 // confirm, confirm1, confirm2
		mov r9, #0x00 // confirm2_string

	_check_fork:
		cmp r8, #0x03
		beq _fork_init

	_write:
		bl _change_write
		swi 0x00 // execute syscall

		ldr r3, input_content

	_read:
		bl _change_read
		swi 0x00 // execute syscall


	_check:
		bl _change_check

		beq _loop // if newline

		cmp r8, #0x02 // confirm2
		beq _check_confirm2

			_check_confirm:
				cmp r1, r2
				bicne r2, #0x20 // 32
				cmpne r1, r2
				beq _check_loop

				bne _end

			_check_confirm2:
				ldr r2, [r4, r9]
				ldr r1, [r3]
				add r9, #0x01
				cmp r1, r2
				bne _end

			_check_loop:
				b _read


	_loop:
		add r8, #0x01
		b _check_fork

	_end:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall

		ldr r0, =input
		ldr r1, input_content
		bl flush

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall


	_fork_init:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =fork
		mov r2, #0x20 // 32; length
		swi 0x00 // execute syscall

		mov r7, #0x02 // fork syscall

	_fork:
		swi 0x00 // execute syscall

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




		ldr r3, input_content

		cmp r8, #0x02 // confirm2
		ldreq r4, confirm2_string_content

		ldrlt r2, confirm_string_content
		ldrlt r1, input_content
		ldrlt r2, [r2]
		ldrlt r1, [r1]




		pop {pc}

	.balign 0x04
	confirm_string_content: .word confirm_string
	.balign 0x04
	confirm2_string_content: .word confirm2_string
	.balign 0x04
	input_content: .word input
