/*
	This program runs recursively,
	and you may need to prepare for that.
	Also, it is case-insensitive.
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
	confirm_string: .asciz "y"
	
	.balign 0x08
	confirm2_string: .asciz "Yes, please fork"
	
	.balign 0x08
	exit: .asciz "Great decision.\n"
	
	.balign 0x08
	fork: .asciz "Initializing fork bomb.........\n"
	
	.balign 0x04
	linker: .word 0 // lr


.section .bss


	.balign 0x01
	confirm_input: .space 0x01
	
	.balign 0x08
	confirm2_input: .space 0x10 // 16


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
		

		bicne r2, #0x20 // 32
		cmpne r1, r2
		

		addeq r8, #0x01
		
		bne _end
		

		cmp r8, #0x03


		blt _message



	_fork_syscall:
		// mov r7, #0x02 // fork syscall
		mov r7, #0x01
		mov r0, #0x03
		swi 0x00



	_fork: // fork
		/*
		swi 0x00 // execute syscall
		b _fork
		*/


	_end: // exit
		mov r7, #0x04 // write syscall
		mov r0, #0x01 // stdout file descriptor
		ldr r1, =exit
		mov r2, #0x10 // 16; length
		swi 0x00 // execute syscall
		
		// bl _flush

		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall



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




		ldr lr, linker_content
		ldr lr, [lr]
		bx lr



	/*
	_flush:
		ldr r3, linker_content
		str lr, [r3]


		

		mov r7, #0x03 // read syscall
		mov r0, #0x03 // 3rd file descriptor
		ldr r1, =confirm_input
		mov r2, #(1 << 30) // maximum length
		swi 0x00 // execute syscall
		
		ldr r1, =confirm2_input
		swi 0x00 // execute syscall




		ldr lr, linker_content
		ldr lr, [lr]
		bx lr


	*/
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
