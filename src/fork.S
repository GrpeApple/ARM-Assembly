.section .data
	/* I spent my time making the length fit. (Including this comment.) */
	.balign 0x10 // 16
	confirm: .ascii "Do you want to continue? (y/N): "
	.balign 0x10 // 16
	confirm1: .ascii "Are you sure about this? (y/N): "
	.balign 0x10 // 16
	confirm2: .ascii "Final warning.....\nAre you absolutely sure? (Yes, please fork): "
	.balign 0x01
	confirm_input: .ascii "y" // allocate
	.balign 0x08
	confirm2_input: .ascii "Yes, please fork" // allocate
	.balign 0x01
	confirm_string: .ascii "y"
	.balign 0x08
	confirm2_string: .ascii "Yes, please fork"
	.balign 0x08
	exit: .ascii "Great decision.\n"
	.balign 0x08
	fork: .ascii "Initializing fork bomb.........\n"

.section .text

	.global _start
	_start:
		mov r8, #0x00 // which level are we (confirm, confirm1, confirm2)
		mov r9, #0x00 // which syscall we switch
		mov r10, #0x00 // which level are we (_message and _input, _check, _end and _fork)

	_change:
		cmp r9, #0x00 // write
		moveq r7, #0x04 // write syscall
		moveq r0, #0x01 // stdout file descriptor
		
		cmp r9, #0x01 // read
		moveq r7, #0x03 // read syscall
		moveq r0, #0x00 // stdin file descriptor

		cmp r9, #0x02 // fork
		moveq r7, #0x02 // fork syscall
		
		cmp r9, #0x03 // exit
		moveq r7, #0x01 // exit syscall
		moveq r0, #0x00 // exit status
		
		cmp r10, #0x00 // _message and _input
		bne _change2 // _check

	_change1:
		cmp r9, #0x00 // write
		bne _change1_input


	_change1_message:
		cmp r8, #0x00 // confirm
		ldreq r1, =confirm

		cmp r8, #0x01 // confirm1
		ldreq r1, =confirm1
		
		cmp r8, #0x02 // confirm2
		ldreq r1, =confirm2
		
		movlt r2, #0x20 // 32; length
		moveq r2, #0x40 // 42; length
		
	_change1_input:
		cmp r8, #0x02 // confirm2 

		ldrlt r1, =confirm_input
		movlt r2, #0x01 // length
		
		ldreq r1, =confirm2_input
		moveq r2, #0x10 // 16; length


	_change2: // _check
		cmp r10, #0x01 // _check
		bne _change3 // _end and fork
		

	_change2_check:
		cmp r8, #0x02 // confirm2
		

		ldrlt r1, confirm_input_content
		ldrlt r2, confirm_string_content

		ldreq r1, confirm2_input_content
		ldreq r2, confirm2_string_content

	_change3:
		cmp r10, #0x02 // fork
		bne _change3_end
		
		ldr r1, =exit
		mov r2, #0x10 // 16; length

	_change3_fork:
		b _fork

	_change3_end:
		cmp r9, #0x01

		bne _end
		movne r9, #0x01
		bne _change
		
		beq _end

	_message: // write
		swi 0x00 // execute syscall
		mov r9, #0x01 // read
		b _change

	_input: // read
		swi 0x00 // execute syscall
		mov r9, #0x00 // read
		mov r10, #0x01
		b _change

	_check:
		ldr r1, [r1]
		ldr r2, [r2]
		cmp r1, r2
		addeq r8, #0x01
		beq _change
		bic r2, #0x20 // 32; 6th bit
		addeq r8, #0x01
		beq _change

	_fork:
		/*
		swi 0x00 // execute syscall
		b _fork
		*/

	_end: // exit
		swi 0x00 // execute syscall

	.balign 4
	confirm_input_content: .word confirm_input
	.balign 4
	confirm2_input_content: .word confirm2_input_content
	.balign 4
	confirm_string_content: .word confirm_string
	.balign 4
	confirm2_string_content: .word confirm2_string
