.code 32 // arm
.syntax unified

.section .text

	.global _start
	_start:
		pop {r0, ip} // argc
		cmp r0, #0x00 // Is argc 0? (Should not happen)
		moveq r3, #0x01 // exit status

	_rmdir:
		pop {r0} // argv
		cmp r0, #0x00 // Did we reach the end of argv?
		beq _end

		mov r7, #0x28 // 40; rmdir syscall
		swi #0x00 // execute syscall

		b _rmdir

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, r3 // exit status
		swi #0x00 // execute syscall
