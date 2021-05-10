/*
	Exit status:
		0: Successfull exit
		1: Error
*/

.code 32 // arm
.syntax unified

.section .data

	.balign 0x10 // 16
	input_msg: .asciz "Input a string to uppercase on: "
	.balign 0x08
	out_msg: .asciz "Result: "

.section .text

	.global _start
	_start:
		sub sp, #0x04 // string
		mov fp, sp // string

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =input_msg
		mov r2, #0x20 // 32; length
		swi #0x00 // execute syscall

		bl _input

	_output_message:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =out_msg
		mov r2, #0x08 // length
		swi #0x00 // execute syscall


	_uppercase:
		ldr r0, [fp] // string

		/* Check if special or uppercase */
		cmp r0, #0x7a // 122; 'z'
		bgt _output

		cmp r0, #0x60 // 96; '`'
		bicgt r0, r0, #0x20 // 32; Uppercase

	_output:
		str r0, [fp] // string

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		mov r1, fp
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

		bl _input
		b _uppercase

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall


	_input:
		push {lr}

		ldr r0, [fp] // string
		cmp r0, #0x0a // 10; '\n'
		beq _end

		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		mov r1, fp // string
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

		pop {pc}

