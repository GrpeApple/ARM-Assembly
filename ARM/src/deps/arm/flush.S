/*
	Uses registers from r0-r3

	r0 = input address (required)
	r1 = input variable (required)
*/

.code 32 // arm
.syntax unified

.section .text

	.global flush
	flush:
		push {ip, lr}
		push {r0}

			__input:
				mov r7, #0x03 // read syscall
				mov r0, #0x00 // stdin file descriptor
				mov r2, #0x01 // length
				swi 0x00 // execute syscall


			__check:
				pop {r0}
				ldr r3, [r0]
				push {r0}

				cmp r3, #0x0a // 10; newline
				bne __input

		pop {ip}
		pop {ip, pc}
