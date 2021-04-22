.section .text

	.global _start
	_start:
		mov r0, #0x45 // 69
		bl int2str
