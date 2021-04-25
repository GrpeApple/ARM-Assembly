/*
	Uses register r0

	r0 = input address (required)
	r1 = input variable
*/

.code 32 // arm
.syntax unified

.section .text

	.global flush
	flush:
		push {r1-r2, lr}
		mov ip, #0x00
		push {ip} // ip
		push {r0} // r0
		mov r1, r0

			__input:
				ldr r2, [r1] // r0
				cmp r2, #0x0a // 10; '\n'

				popeq {ip} // r0
				popeq {ip} // ip
				popeq {r1-r2, pc}


				mov r7, #0x03 // read syscall
				mov r0, #0x00 // stdin file descriptor
				mov r2, #0x01 // length
				swi #0x00 // execute syscall

				bne __input // if not 10; '\n'
