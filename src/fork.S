/*
	This program runs recursively,
	and you may need to prepare for that.
	Also, it is case-sensitive.
*/
.section .data
	/* I spent my time making the length fit. (Including this comment.) */
	.balign 0x10 // 16
	confirm: .asciz "Do you want to continue? (y/N): "
	.balign 0x10 // 16
	confirm1: .asciz "Are you sure about this? (y/N): "
	.balign 0x10 // 16
	confirm2: .asciz "Final warning.....\nAre you absolutely sure? (Yes, please fork): "
	.balign 0x01
	confirm_input: .asciz "y" // allocate
	.balign 0x08
	confirm2_input: .asciz "Yes, please fork" // allocate
	.balign 0x01
	confirm_string: .asciz "y"
	.balign 0x08
	confirm2_string: .asciz "Yes, please fork"
	.balign 0x08
	exit: .asciz "Great decision.\n"
	.balign 0x08
	fork: .asciz "Initializing fork bomb.........\n"
	.balign 0x04
	linker: .word 0 // lr

.section .text

	.global _start
	_start:
		mov r8, #0x00 // which level are we (confirm, confirm1, confirm2)


	_message: // write
		bl _change_message
		
		swi 0x00 // execute syscall


	_input: // read
		bl _change_input
		
		swi 0x00 // execute syscall


	_check:
		bl _change_check

		ldr r1, [r1]
		ldr r2, [r2]
		
		cmp r1, r2
		cmpne r8, #0x02 // confirm2
		

	_fork_syscall:
		mov r7, #0x02 // fork syscall


	_fork: // fork
		/*
		swi 0x00 // execute syscall
		b _fork
		*/


	_change_message:
		ldr r3, linker_content
		str lr, [r3]



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



		ldr lr, linker_content
		ldr lr, [lr]
		bx lr


	_change_input:
		ldr r3, linker_content
		str lr, [r3]



		mov r7, #0x03 // read syscall
		mov r0, #0x00 // stdin file descriptor

		cmp r8, #0x02 // confirm2 


		ldrlt r1, =confirm_input
		movlt r2, #0x01 // length
		
		ldreq r1, =confirm2_input
		moveq r2, #0x10 // 16; length



		ldr lr, linker_content
		ldr lr, [lr]
		bx lr


	_change_check:
		ldr r3, linker_content
		str lr, [r3]



		cmp r8, #0x02 // confirm2


		ldrlt r1, confirm_input_content
		ldrlt r2, confirm_string_content

		ldreq r1, confirm2_input_content
		ldreq r2, confirm2_string_content

		bgt _fork_syscall


		ldr lr, linker_content
		ldr lr, [lr]
		bx lr


	_end: // exit
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall
		
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall


	.balign 0x04
	confirm_input_content: .word confirm_input
	.balign 0x04
	confirm_string_content: .word confirm_string
	.balign 0x04
	confirm2_input_content: .word confirm2_input
	.balign 0x04
	confirm2_string_content: .word confirm2_string
	.balign 0x04
	linker_content: .word linker // lr
