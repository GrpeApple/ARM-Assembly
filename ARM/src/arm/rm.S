.syntax unified

.section .bss
	file: .asciz ""

.section .text

	.global _start
	_start: ldr r3, file_content

	_read:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =file
		mov r2, #(0x01 << 0x1e) // 30; maximum length
		swi 0x00 // execute syscall

		sub r0, #0x01
		strb ip, [r3, r0] // terminate

	_unlink:
		mov r7, #0x0a // 10; unlink syscall, aka remove files
		ldr r0, =file
		swi 0x00 // execute syscall

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall

	file_content: .word file
