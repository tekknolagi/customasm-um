#include "../um.asm"

loadi r0, 48
loadi r1, 12345678
loadi r4, 1
loadi r5, 10
loadi r2, 0
loadi r3, 0
loadi r4, 1
loadi r6, loop

loop:
	div r1, r1, r5
	add r3, r4, r3
	loadi r7, end
	cmov r7, r6, r1
	loadp r2, r7

end:
add r3, r0, r3
out r3
loadi r3, 10
out r3
halt