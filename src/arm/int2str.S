/*
	I recommend you use the compiler and check the assembly output with -S.
	If something does not make sense, try using different optimization levels.
*/

.equ division, 0x66666667 // 1717986919; (2 ^ 34 + 6) / 10

.section .text

	.global _start
	_start:
		push {ip}
		mov r4, #(0x0001 << 0x001e) // replace this
		mov r0, r4

	_division:
		/*
			If your architecture is ARMv7 (or above).
			movw r1, #:lower16:division // 26215
			movt r1, #:upper16:division // 26214
		*/
		ldr r1, =division
		smmul r1, r0, r1
		asr r2, r1, #0x0002
		
	_modulo:
		add r1, r2, r1, lsr #0x001f // 31
		add r1, r1, r1, lsl #0x0002
		sub r0, r0, r1, lsl #0x0001

	_string:
		add r0, #0x0030 // 48; 0
		push {r0}

	_shift:
		mov r0, r2
		cmp r0, #0x0000
		bne _division

	_stack:
		ldr r1, [sp]
		cmp r1, #0x0000
		beq _end

	_write:
		mov r7, #0x0004 // write syscall
		mov r0, #0x0001 // stdout file descriptor
		mov r1, sp
		pop {ip}
		mov r2, #0x0001 // length
		swi 0x0000 // execute syscall

		b _stack

	_end:
		mov r7, #0x0001 // exit syscall
		mov r0, #0x0000 // exit status
		swi 0x0000 // execute syscall
