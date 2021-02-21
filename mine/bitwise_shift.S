.global main
.global _start
.text
_start:
	mov r0, #255
end:
	mov r7, #0x01
	swi 0
