/*
	Uses register r0

	r0 = integer to be converted (required)
	r1 = magic division number
	r2 = division
*/

.code 32 // arm
.syntax unified

.equ division, 0x66666667 // 1717986919; (2 ^ 34 + 6) / 10

.section .text

	.global int2str
	int2str:
		push {r1-r2, lr}
		push {ip}
		mov r1, #0x0a // 10; newline
		push {r1}

			__division:
				/*
					If your architecture is ARMv7 (or above).
					movw r1, #:lower16:division // 26215
					movt r1, #:upper16:division // 26214
				*/
				ldr r1, =division
				smmul r1, r0, r1
				asr r2, r1, #0x02

			__modulo:
				add r1, r2, r1, lsr #0x1f // 31
				add r1, r1, r1, lsl #0x02
				sub r0, r0, r1, lsl #0x01

			__string:
				add r0, #0x30 // 48; '0'
				push {r0}

			__shift:
				mov r0, r2
				cmp r0, #0x00
				bne __division

			__write:
				ldr r1, [sp]
				cmp r1, #0x00
				popeq {ip}
				popeq {r1-r2, pc}

				mov r7, #0x04 // write syscall
				mov r0, #0x01 // stdout file descriptor
				mov r1, sp
				pop {ip}
				mov r2, #0x01 // length
				swi 0x00 // execute syscall

				bne __write
