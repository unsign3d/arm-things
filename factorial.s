/* factorial */

.global _start

_start:

	mov		%r0, $1 	/* result */
	mov		%r1, $6		/* input */
	mov		%r2, %r1	/* temp */

	/* check if we are in the fact(1) */
	cmp 	%r0, %r1
	beq		_end

_while:
	cmp		%r2, $1
	bls		_end
	/* if we are here we must do the iteration */
	mul 	%r0, %r2, %r0
	sub		%r2, $1
	b 		_while

_end:
	/* syscall exit(status) */
	mov		%r0, $0		/* status -> 0 */
	mov		%r7, $1		/* exit is the syscall 1 */
	swi		$0			/* invoke syscall */
