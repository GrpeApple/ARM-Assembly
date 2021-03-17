.syntax unified

.section .data


	/* I spent my time making the length fit. (Including this comment.) */

	.balign 0x10 // 16
	confirm: .asciz "Do you want to continue? (y/N): "
	
	.balign 0x10 // 16
	confirm1: .asciz "Are you sure about this? (y/N): "
	
	.balign 0x10 // 16
	confirm2: .asciz "Final warning.....\nAre you absolutely sure? (Yes, please fork): "
	
	.balign 0x01
	confirm_string: .asciz "y"
	
	.balign 0x08
	confirm2_string: .asciz "Yes, please fork"
	
	.balign 0x08
	exit: .asciz "Great decision.\n"
	
	.balign 0x10 // 16
	fork: .asciz "Initializing fork bomb.........\n"

.section .bss
	flush:

.section .text
	
	.global _start
	_start:
		mov r8, #0x00 // confirm, confirm1, confirm2
		push {ip}
		mov fp, sp

	_check_fork:
		cmp r8, #0x03
		beq _fork_init

	_write:
		bl _change_write
		swi 0x00 // execute syscall


	_read:
		bl _change_read
		swi 0x00 // execute syscall


	_check:
		bl _change_check
		push {r2}
		cmp r8, #0x02 // confirm2
		cmpne r1, r2
		bicne r2, #0x20 // 32

		cmp r1, r2
		bne _end

	_loop:
		cmp r8, #0x02 // confirm2
		ldreq r3, confirm2_string_content

		ldrlt r3, confirm_string_content

		pop {r2}
		str r2, [r3]
		
		add r8, #0x01
		bl _flush
		b _check_fork
	
	_flush:
		push {lr}




		cmp r1, #0x0a // 10; newline
		beq _end

		mov r7, #0x03 // read syscall
		mov r0, #0x02 // stderr file descriptor
		ldr r1, =flush
		mov r2, #(0x01 << 0x1e) // maximum length
		swi 0x00 // execute syscall





		pop {pc}

	_end:
		cmp r8, #0x02 // confirm2
		blne _flush

		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall


	_fork_init:
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =fork
		mov r2, #0x20 // 32; length
		swi 0x00 // execute syscall
	
		mov r7, #0x02 // fork syscall
	
	_fork:
		swi 0x00 // execute syscall

		b _fork

	_change_write:
		push {lr}




		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		
		cmp r8, #0x00 // confirm
		ldreq r1, =confirm

		cmp r8, #0x01 // confirm1
		ldreq r1, =confirm1

		cmp r8, #0x02 // confirm2
		ldreq r1, =confirm2
		moveq r2, #0x40 // 64; length
		
		movlt r2, #0x20 // 32; length




		pop {pc}

	_change_read:
		push {lr}




		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor

		cmp r8, #0x02 // confirm2
		ldreq r3, confirm2_string_content
		ldreq r1, =confirm2_string
		moveq r2, #0x10 // 16; length

		ldrlt r3, confirm_string_content
		ldrlt r1, =confirm_string
		movlt r2, #0x01 // length

		ldr r3, [r3]
		str r3, [fp]!




		pop {pc}

	_change_check:
		push {lr}




		cmp r8, #0x02 // confirm2
		ldreq r1, confirm2_string_content

		ldrlt r1, confirm_string_content

		ldr r1, [r1]
		ldr r2, [fp]




		pop {pc}

	.balign 0x04
	confirm_string_content: .word confirm_string
	.balign 0x04
	confirm2_string_content: .word confirm2_string
