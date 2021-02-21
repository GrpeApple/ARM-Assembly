.global _start
.text
_start:
	mov r0, #0
	mov r1, #1
	b _loop

_loop: // for (int r0 = 0; r0 <= 9; r0 = r0 + 1)
	add r0, r1
	cmp r0, #9
	ble _loop

end:
	mov r7, #0x01
	swi 0
