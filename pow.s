/* 3^4 */

.global _start

_start:
	/* put the operands in the r1 and r2 register */
	mov		%r1, $3
	mov		%r2, $4
	/* set result eq 1 which is the neutral elem for
		the mul */

	mov		%r0, $1

	/* implementation of the while */
	_while:
		cmp		%r2, $0
		beq		_end_while
		mul		%r0, %r1, %r0 /* put the r1*r0 result on r0 */
		sub		%r2, $1		/* r2-- */
		b 		_while
	_end_while:

	/* and then exit */
	/* syscall exit(status) */
	mov		%r0, $0		/* status -> 0 */
	mov		%r7, $1		/* exit is the syscall 1 */
	swi		$0			/* invoke syscall */

