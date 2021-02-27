.section .data
	.balign 8
	confirm: .asciz "WARNING: save your files first\nAre you sure you want to fork your device? (y/N): "
	.balign 4
	confirm_len = . - confirm
	.balign 8
	init: .asciz "fork bomb initialized."
	.balign 4
	init_len = . - init
	.balign 8
	exit: .asciz "Good choice."
	.balign 4
	exit_len = . - exit
	.balign 4
	confirm_input: .asciz " "
	.balign 4
	confirm_char: .asciz "y"

.section .text

	.global _start
	_start:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =confirm
		ldr r2, =confirm_len // length
		swi 0 // execute syscall

	_input:
		mov r7, #0x03 // read syscall
		mov r0, #0 // stdin file descriptor
		ldr r1, =confirm_input
		mov r2, #1 // length
		swi 0
	
	_check:
		ldr r3, addr_confirm_input
		ldr r4, addr_confirm_char
		ldr r1, [r3]
		ldr r2, [r4]
		cmp r1, r2
		beq _init
		bic r2, r2, #32 // make uppercase
		cmp r1, r2
		beq _init

	end:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =exit
		ldr r2, =exit_len // length
		swi 0 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall

	_init:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		ldr r1, =init
		ldr r2, =init_len // length
		swi 0

	_fork:
		mov r7, #0x02 // fork syscall
		swi 0 // execute syscall

	_loop:
		b _fork // goto label _fork

	.balign 4
	addr_confirm_input: .word confirm_input
	.balign 4
	addr_confirm_char: .word confirm_char
