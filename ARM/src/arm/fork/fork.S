/*
	Depends on: flush.S
*/

.code 32 // arm
.syntax unified

.section .data
	/* I spent my time making the length fit. (Including this comment.) */
	confirm:
	.balign 0x10 // 16
	.asciz "Do you want to continue? (y/N): " // confirm
	.balign 0x10 // 16
	.asciz "Are you sure about this? (y/N): " // confirm1
	.balign 0x10 // 16
	.asciz "Final warning.....\nAre you absolutely sure? (Yes, please fork): " // confirm2

	confirm_string:
	.balign 0x01
	.asciz "y" // confirm, confirm1
	.balign 0x08
	.asciz "Yes, please fork" // confirm2

	.balign 0x08
	exit: .asciz "Great decision.\n"
	.balign 0x10 // 16
	fork: .asciz "Initializing fork bomb.........\n"

.section .bss
	.balign 0x01
	input: .space 0x01

.section .text

	.global _start
	_start:
		ldr r3, =confirm // confirm_address
		/*	r4 -- confirm_level
			r5 -- confirm_index	*/
		ldr r6, =confirm_string // check_confirm_address
		ldr r8, =input // input_address

	_write:
		cmp r4, #0x02 // confirm2
		movlt r2, #0x20 // 32; length

		moveq r2, #0x40 // 64; length

		mov r7, #0x04 // write syscall
		mov r1, r3 // confirm_address
		mov r0, #0x01 // stdout file descriptor
		swi #0x00 // execute syscall

	_input:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		mov r1, r8 // input
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

	_check:
		ldr r1, [r8] // input <- input_address
		ldrb r2, [r6, r5] // check_confirm_character <- check_confirm_address[confirm_index]

		cmp r4, #0x02 // confirm2
		beq _check_confirm2

		_check_confirm:
			cmp r5, #0x01
			cmpeq r1, #0x0a // 10; '\n'
			beq _loop

			cmp r1, r2
			bicne r2, #0x20 // 32; Uppercase
			cmpne r1, r2
			bne _end

			add r5, #0x01 // confirm_index++
			b _input

		_check_confirm2:
			cmp r5, #0x10 // 16
			cmpeq r1, #0x0a // 10; '\n'
			addeq r4, #0x01 // confirm_level++
			beq _loop

			cmp r1, r2
			bne _end

			add r5, #0x01 // confirm_index++
			b _input

	_loop:
		mov r5, #0x00 // confirm_index

		cmp r4, #0x03 // Did we pass all confirmations?
		beq _fork

		add r3, #0x30 // confirm_address++
		add r4, #0x01 // confirm_level++

		cmp r4, #0x02 // confirm2
		addeq r6, #0x07 // confirm2_string

		b _write

	_end:
		mov r0, r8 // input_address
		bl flush

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall

	_fork:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =fork
		mov r2, #0x20 // 32; length
		swi #0x00 // execute syscall

		mov r7, #0x02 // fork syscall

			_init:
				swi #0x00 // execute syscall
				b _init
