.code 32 // arm
.syntax unified

.section .text

	.global _start
	_start:
		pop {r0, ip} // argc

		cmp r0, #0x00 // Should NOT happen
		moveq r3, #0x01 // exit status

	_unlink:
		pop {r0} // arg <- argv[i]
		cmp r0, #0x00 // End of argv?
		beq _end

		mov r7, #0x0a // 10; unlink syscall, aka remove files
		swi #0x00 // execute syscall

		b _unlink

	_end:
		mov r7, #0x01 // exit syscall
		mov r0, r3 // exit status
		swi #0x00 // execute syscall
