.syntax unified

.section .data
	.balign 0x08
	prompt: .ascii "Enter anything: "
	.balign 0x08
	output_prompt: .ascii "Output: "

.section .bss
	input: .space 1

.section .text
	
	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =prompt
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall

	_input:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =input
		mov r2, #(0x01 << 0x1e) // 30; maximum length
		swi 0x00 // execute syscall

	
	_output:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =output_prompt
		mov r2, #0x08 // length
		swi 0x00 // execute syscall

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =input
		mov r2, #(0x01 << 0x1e) // 30; maximum length
		swi 0x00 // execute syscall
	

	_flush:
        	mov r7, #0x03 // read syscall
		mov r0, #0x03 // file descriptor
		ldr r1, =input
		mov r2, #(0x01 << 0x1e) // 30; maximum length
		swi 0x00 // execute syscall

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
	
