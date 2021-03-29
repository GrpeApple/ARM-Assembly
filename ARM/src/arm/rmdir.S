.code 32 // arm
.syntax unified

.section .bss
	dir: .asciz ""

.section .text

	.global _start
	_start: ldr r3, dir_content

	_read:
		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		ldr r1, =dir
		mov r2, #(0x01 << 0x1e) // 30; maximum length
		swi 0x00 // execute syscall

		sub r0, #0x01
		strb ip, [r3, r0] // terminate

	_rmdir:
		mov r7, #0x28 // 40; rmdir syscall
		ldr r0, =dir
		swi 0x00 // execute syscall

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall

	dir_content: .word dir
