/*
	Depends on: int2str.S
*/

.code 32 // arm
.syntax unified

.section .data
	.balign 0x04
	input_string: .asciz "String: "

	.balign 0x04
	ascii_string: .asciz "ASCII: "

.section .bss
	.balign 0x01
	input: .space 0x01

.section .text

	.global _start
	_start:
		mov r0, #0x0a // 10; '\n'
		push {r0}

		ldr r3, =input

	_string:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =input_string
		mov r2, #0x08 // length
		swi #0x00 // execute syscall

		bl _input

	_ascii:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =ascii_string
		mov r2, #0x07 // length
		swi #0x00 // execute syscall


	_loop:
		ldr r0, [r3]
		push {r0}
		bl int2str

		mov r0, #0x20 // 32; ' '
		push {r0}

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		mov r1, sp
		mov r2, #0x01 // length
		swi #0x00 // execute syscall

		pop {ip}
		mov ip, #0x00
		pop {r0}
		cmp r0, #0x0a // 10; '\n'
		beq _end

		bl _input
		b _loop

	_end:
		mov r0, #0x01 // stdout file descriptor
		mov r1, sp // '\n'
		swi #0x00 // execute syscall; write

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi #0x00 // execute syscall


	_input:
		push {ip, lr}

		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor
		mov r1, r3
		mov r2, #0x01 // length
		swi #0x00

		pop {ip, pc}
