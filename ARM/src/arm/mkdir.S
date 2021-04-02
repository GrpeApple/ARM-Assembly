/*
	This may depend on your length of filenames; exceeding the length may cause the directory to be not created.
*/

.code 32 // arm
.syntax unified

.section .text

	.global _start
	_start:
		pop {r0, ip} // argc
		cmp r0, #0x000 // Is argc 0? (Should not happen)
		moveq r3, #0x001 // exit status

	_mkdir:
		pop {r0} // argv
		cmp r0, #0x000 // Did we reach the end of argv?
		beq _end

		mov r7, #0x027 // mkdir syscall
		mov r1, #0x1f4 // 500; Permissions
		swi 0x00 // execute syscall

		b _mkdir

	_end:
		mov r7, #0x001 // exit syscall
		mov r0, r3 // exit status
		swi 0x000 // execute syscall
