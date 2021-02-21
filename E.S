.data
	E:
		.ascii "E"
.globl _start
.text
	_start:
		loop: // while true loop
			mov r7, #0x04 // write syscall
			mov r0, #1 // stdout file descriptor
			ldr r1, =E
			mov r2, #1 // length
			swi 0 // output E
			b loop // unconditional loop

		mov r7, #0x01 // exit syscall
		mov r0, #0
		swi 0 // exit with status 0
