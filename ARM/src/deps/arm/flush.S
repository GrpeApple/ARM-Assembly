/*
	Uses registers from r0-r1

	r0 = input address (required)
	r1 = input variable (required)
*/

.code 32 // arm
.syntax unified

.section .text

	.global flush
	flush:
		push {r2-r3, lr}
		push {ip} // ip
		push {r0} // r0

			__input:
				pop {r0}
				ldr r3, [r0]
				push {r0}

				cmp r3, #0x0a // 10; newline

				popeq {ip} // r0
				popeq {ip} // ip
				popeq {r2-r3, pc}


				mov r7, #0x03 // read syscall
				mov r0, #0x00 // stdin file descriptor
				mov r2, #0x01 // length
				swi 0x00 // execute syscall

				bne __input // if not 10; newline
