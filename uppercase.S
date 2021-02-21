/*
	Exit status:
		0: Successfull exit
		// 1: Error
	System Calls:
		0x01: exit
		0x03: read
		0x04: write
	Standard Streams:
		0: stdin
		1: stdout
		// 2: stderr
*/
.section .data
	input_msg:
		.ascii "Input a character to uppercase: "
	char:
		.asciz ""
	out_msg:
		.ascii "Uppercased character: "
/*
	err_msg:
		.ascii "Error: no character input"
*/

.global _start
.section .text
_start:
	mov r7, #0x04 // system call
	mov r0, #1 // standard stream
	ldr r1, =input_msg
	mov r2, #32 // length
	swi 0

_input:
	mov r7, #0x03 // system call
	mov r0, #0 // standard stream
	ldr r1, =char
	mov r2, #1 // length
	swi 0

_uppercase:
	ldr r1, =char
	ldr r0, [r1]
	/*
		make uppercase, example:
		    128 64 32 16 8 4 2 1
		a = 0   1  1  0  0 0 0 1
		A = 0   1  0  0  0 0 0 1
	*/
	bic r0, r0, #32
	str r0, [r1]

_output:
	mov r7, #0x04 // system call
	mov r0, #1 // standard stream
	ldr r1, =out_msg
	mov r2, #22 // length
	swi 0

	mov r7, #0x04 // system call
	mov r0, #1 // standard stream
	ldr r1, =char
	mov r2, #1 // length
	swi 0

/*
error:
	mov r7, #0x04 // system call
	mov r0, #2 // standard stream
	ldr r1, =err_msg
	mov r2, #26 // length
	swi 0

	mov r7, #0x01 // system call
	mov r0, #1 // exit status
	swi 0
*/

end:
	mov r7, #0x01 // system call
	mov r0, #0 // exit status
	swi 0
