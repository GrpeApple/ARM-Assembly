/*
	For end-users (not really)
	Exit status:
		0: Successfull exit
		// 1: Error
*/
.section .data
	input_msg: .ascii "Input a character to uppercase: "
	char: .asciz ""
	out_msg: .ascii "Uppercased character: "
	// err_msg: .ascii "Error: no character input"

.section .text
	
	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =input_msg
		mov r2, #32 // length
		swi 0 // execute syscall

	_input:
		mov r7, #0x03 // read syscall
		mov r0, #0 // stdin file descriptor
		ldr r1, =char
		mov r2, #1 // length
		swi 0 // execute syscall

	_uppercase:
		ldr r1, =char
		ldr r0, [r1] // load from address
		/*
			make uppercase, example:
			    128 64 32 16 8 4 2 1
			a = 0   1  1  0  0 0 0 1
			A = 0   1  0  0  0 0 0 1
		*/
		bic r0, r0, #32 // bit clear sixth bit
		str r0, [r1] // store from address

	_output:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =out_msg
		mov r2, #22 // length
		swi 0 // execute instruction

		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =char
		mov r2, #1 // length
		swi 0 // execute instruction

	/*
	error:
		mov r7, #0x04 // write syscall
		mov r0, #2 // stderr file descriptor
		ldr r1, =err_msg
		mov r2, #26 // length
		swi 0 // execute instruction

		mov r7, #0x01 // exit syscall
		mov r0, #1 // exit status
		swi 0 // execute instruction
	*/

	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute instruction
