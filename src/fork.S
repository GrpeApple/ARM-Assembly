.section .data
	/* I spent my time making the length fit. (Including this comment.) */
	.balign 16
	confirm: .ascii "Do you want to continue? (y/N): "
	.balign 16
	confirm1: .ascii "Are you sure about this? (y/N): "
	.balign 16
	confirm2: .ascii "Final warning.....\nAre you absolutely sure? (Yes, please fork): "
	.balign 1
	confirm_input: .ascii "y"
	.balign 8
	confirm_input2: .ascii "Yes, please fork"
.section .text

	.global _start
	_start:
		mov r8, #0

	_check:
		cmp r8, #0
		ldreq r1, =confirm
		cmp r8, #1
		ldreq r1, =confirm1
		cmp r8, #2
		ldreq r1, =confirm2
		
		/* length */
		movlt r2, #0x20 // 32
		moveq r2, #0x40 // 42
	
	end:
		mov r7, #0x01 // exit syscall
		mov r0, #0x00 // exit status
		swi 0x00 // execute syscall
