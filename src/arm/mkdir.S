/*
	The max directory file name is 255 (linux)
	This won't allow you to make directories that are nested that the path exceeds 255. Sorry, about that bug.
	Exit status:
		0: exit successfully
		1: Directory length error (255)
*/

.syntax unified

.section .data
	err: .ascii "Error: directory length exceeds 255."
	len= .- err

.section .bss
	dir: .asciz ""

.section .text

	.global _start
	_start:
		ldr r3, dir_content

	_read:
		mov r7, #0x003 // read syscall
		mov r0, #0x000 // stdin file descriptor
		ldr r1, =dir
		mov r2, #(0x001 << 0x01e) // 30; maximum length
		swi 0x000 // execute syscall
		
		mov r2, #0x000
			_terminate:
				cmp r2, #0x100 // 256
				beq _error

				ldrb r5, [r3, r2]
				cmp r5, #0x00a // 10; newline
				strbeq ip, [r3, r2]
				addne r2, #0x001
				bne _terminate

	_mkdir:
		mov r7, #0x027 // mkdir syscall
		ldr r0, =dir
		mov r1, #0x1f4 // 500; Permissions
		swi 0x00 // execute syscall


	_flush:
		mov r7, #0x003 // read syscall
		mov r0, #0x003 // file descriptor
		ldr r1, =dir
		mov r2, #(0x001 << 0x01e) // 30; maximum length
		swi 0x00 // execute syscall

		
	_end:
		mov r7, #0x001 // exit syscall
		mov r0, #0x000 // exit status
		swi 0x000 // execute syscall


	_error:
		mov r7, #0x004 // write syscall
		mov r0, #0x002 // stderr file descriptor
		ldr r1, =err
		ldr r2, =len
		swi 0x000 // execute syscall

		mov r7, #0x001 // exit syscall
		mov r0, #0x001 // exit status
		swi 0x000 // execute syscall


	dir_content: .word dir
