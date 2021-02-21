/*
	cmdline.s

	List the command line parameters,
	one line each.

	Code by Adam Stanislav
*/

	.global	_start

_start:

	ldr		r4, [sp]		@ R4 = "argc"
	mov		fp, sp			@ FP = "*argv[-1]"

	cmp		r4, #0			@ This should never happen
	moveq	r0, #1			@ Error return
	beq		.LFinished

	@ A local line feed string
	sub		sp, sp, #8
	mov		r0, #10
	str		r0, [sp]		@ *SP = "\n\000\000\000"

.LNextArgument:

	ldr		r0, [fp, #4]!	@ R0 = "*(++argv)"
	mvn		r2, #0			@ R2 = -1 (unknown length)
	mov		r1, r0

.LStrlen:

	ldrb	r3, [r0], #1	@ R1 = Next byte of "argv[i]", R0++
	add		r2, r2, #1		@ R2++
	cmp		r3, #0
	bne		.LStrlen

	@ We have the string address in R1, length in R2, let's print it.
	mov		r7, #4			@ Syscall write
	mov		r0, #1			@ Standard output
	swi		0				@ Call the system service

	@ Print a line feed

	mov		r0, #1			@ Standard output
	mov		r1, sp			@ Address of line feed
	mov		r2, r0			@ Just one byte to write
	mov		r7, #4			@ Syscall write
	swi		0				@ Call the system service

	@ Are we done yet?
	subs	r4, r4, #1		@ Decrease the counter
	bne		.LNextArgument	@ No, not done yet

	@ Yes, we are done, let's get outa here!

	add		sp, sp, #8
	mov		r0, #0

.LFinished:

	mov	r7, #1
	swi	0
