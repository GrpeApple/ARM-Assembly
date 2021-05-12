.code 32 // arm
.syntax unified

.section .data

.section .text

	.global _start
	_start:
		mov r7, #0x05 // open syscall
		ldr r0, [sp, #0x04] // argument 0; program name
		/*	mov r1, #0x00 // read-only flag
			mov r2, #0x00 // Permissions	*/
		swi #0x00 // execute syscall

		mov r3, r0 // file descriptor
		push {ip} // buffer

	_read:
		mov r7, #0x03 // read syscall
		mov r0, r3 // file descriptor
		mov r1, sp // buffer; A stack can only contain a word (4 bytes).
		mov r2, #0x04 // buffer count
		swi #0x00 // execute syscall

		cmp r0, #0x04 // buffer count

	_write:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		mov r2, #0x04 // buffer count
		swi #0x00 // execute syscall

		streq ip, [r1] // empty buffer
		beq _read

	_close:
		mov r7, #0x06 // close syscall
		mov r0, r3 // file descriptor
		swi #0x00 // execute syscall


	_end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall
