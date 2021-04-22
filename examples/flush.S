// Please note that this is just an example.

.section .data
	input: .ascii "Yes."

.section .text

	.global _start
	_start:
		ldr r0, input_content
		ldr r1, =input
		bl flush

	input_content: .word input

