.code 32 // arm
.syntax unified

.section .data
	.balign 0x08
	prompt: .asciz "Enter anything: "
	.balign 0x08
	flush_prompt: .asciz "Flushed buffer.\n"

.section .bss
	buffer: .space 1

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =prompt
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall


	_flush:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =buffer
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

		ldr r3, [r1] // buffer
		cmp r3, #0x0a // 10; '\n'
		bne _flush

	_flush_prompt:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =flush_prompt
		mov r2, #0x10 // 16; length
		swi #0x00 // execute syscall


	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
