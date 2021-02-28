.section .data
	.balign 8
	confirm: .asciz "WARNING: save your files first!\nAre you sure you want to fork your device? (y/N): "
	.balign 4
	confirm_len = . - confirm
	.balign 8
	confirm1: .asciz "WARNING: This might destroy your device.\nAre you absolutely sure? (y/N): "
	.balign 4
	confirm1_len = . - confirm1
	.balign 8
	confirm2: .asciz "ARE YOU REALLY SURE?\nEnter 'Yes, I am sure. Now take me to the fork bomb.' to confirm:\n"
	.balign 4
	confirm2_len = . - confirm2
	.balign 8
	init: .asciz "fork bomb initialized."
	.balign 4
	init_len = . - init
	.balign 8
	exit: .asciz "Aborted, good choice."
	.balign 4
	exit_len = . - exit
	.balign 8
	exit2: .asciz "Entered incorrectly, aborting..."
	.balign 4
	exit2_len = . - exit2
	.balign 8
	confirm_input: .ascii "y" // allocate
	.balign 8
	confirm_string: .asciz "y"
	.balign 8
	confirm2_input: .ascii "Yes, I am sure. Now take me to the fork bomb." // allocate
	.balign 8
	confirm2_string: .asciz "Yes, I am sure. Now take me to the fork bomb."

.section .text

	.global _start
	_start:
		mov r8, #0

	_change_message:
		cmp r8, #0
		ldreq r1, =confirm
		ldreq r2, =confirm_len
		cmp r8, #1
		ldreq r1, =confirm1
		ldreq r2, =confirm1_len
		cmp r8, #2
		ldreq r1, =confirm2
		ldreq r2, =confirm2_len

	_message:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		swi 0 // execute syscall
	
	_change_input:
		cmp r8, #2
		ldrlt r1, =confirm_input
		movlt r2, #1 // length
		ldreq r1, =confirm2_input
		moveq r2, #45 // length

	_input:
		mov r7, #0x03 // read syscall
		mov r0, #0 // stdin file descriptor
		swi 0
	
	_change_check:
		cmp r8, #2
		ldrlt r1, addr_confirm_input
		ldrlt r2, =confirm_string
		ldreq r1, addr_confirm2_input
		ldreq r2, =confirm2_string

	_check:
		ldr r1, [r1]
		ldr r2, [r2]
		cmp r1, r2
		beq _check_init
		cmp r8, #2
		biclt r2, #32 // Make uppercase
		cmp r1, r2
		beq _check_init

	_change_end:
		cmp r8, #2
		ldrlt r1, =exit
		ldrlt r2, =exit_len
		ldreq r1, =exit2
		ldreq r2, =exit2_len
	
	end:
		mov r7, #0x04 // write syscall
		mov r0, #1 // stdout file descriptor
		swi 0 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0 // exit status
		swi 0 // execute syscall

	_check_init:
		cmp r8, #2
		addlt r8, #1
		blt _change_message

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
	addr_confirm2_input: .word confirm2_input
