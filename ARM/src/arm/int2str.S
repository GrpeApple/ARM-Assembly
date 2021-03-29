/*
	r3 = magic division number
	r2 = division
	r0 = integer to be converted

	I recommend you use the compiler and check the assembly output with -S.
	If something does not make sense, try using different optimization levels.
*/

.code 32 // arm
.syntax unified
.equ division, 0x66666667 // 1717986919; (2 ^ 34 + 6) / 10

.section .text

	.global _start
	_start:
		push {ip}
		mov r1, #0x0a // 10; newline
		push {r1}
		mov r7, #0x04 // write syscall
		/*
			If your architecture is ARMv7 (or above).
			movw r3, #:lower16:division // 26215
			movt r3, #:upper16:division // 26214
		*/
		ldr r3, =division
		mov r0, #(0x01 << 0x1e) // replace this

	_division:
		smmul r1, r0, r3
		asr r2, r1, #0x02

	_modulo:
		add r1, r2, r1, lsr #0x1f // 31
		add r1, r1, r1, lsl #0x02
		sub r0, r0, r1, lsl #0x01

	_string:
		add r0, #0x30 // 48; '0'
		push {r0}

	_shift:
		mov r0, r2
		cmp r0, #0x00
		bne _division

	_write:
		mov r1, sp
		ldr r3, [r1]
		cmp r3, #0x00
		beq _end

		mov r0, #0x01 // stdout file descriptor
		pop {ip}
		mov r2, #0x01 // length
		swi 0x00 // execute syscall

		bne _write


	_end:
		pop {ip}
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
