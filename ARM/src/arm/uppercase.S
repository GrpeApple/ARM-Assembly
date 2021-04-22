/*
	Exit status:
		0: Successfull exit
		1: Error
*/

.code 32 // arm
.syntax unified

.section .data
	input_msg: .asciz "Input a character to uppercase: "
	out_msg: .asciz "Uppercased character: "

.section .bss
	char: .asciz ""

.section .text

	.global _start
	_start:
		ldr r3, =char

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =input_msg
		mov r2, #0x20 // 32; length
		swi #0x00 // execute syscall


	_input_1:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		mov r1, r3
		mov r2, #0x01 // length
		swi #0x00 // execute syscall


	_output_message:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =out_msg
		mov r2, #0x16 // 22; length
		swi #0x00 // execute syscall


	_uppercase:
		ldr r0, [r3] // load from address

		/* Check if special or uppercase */
		cmp r0, #0x7a // 122; 'z'
		bgt _output
		cmp r0, #0x60 // 96; '`'

		/*
			Make uppercase, example:
			    128 64 32 16 8 4 2 1
			a = 0   1  1  0  0 0 0 1
			Bit clear  32:
			A = 0   1  0  0  0 0 0 1
		*/
		bicgt r0, r0, #0x20 // 32; bit clear sixth bit

	_output:
		str r0, [r3] // store from address

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		mov r1, r3
		mov r2, #0x01 // length
		swi #0x00 // execute syscall


	_input:
		ldr r0, [r3] // load from address
		cmp r0, #0x0a // 10; '\n'
		beq _end

		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		mov r1, r3
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

		b _uppercase

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
