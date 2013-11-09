/* load-store factorial */
 /* data section */
.data

/* we use 32bit variables so we can
	 fit them to the working register */
.balign 4

/* change this to change the number of
	 the factorial */
num:
	.word 6

/* now we can write some serious code */
.text

.balign 4
.global _start

/* define some helper for adresses */
num_addr : .word num

_start:

	mov		%r0, $1 /* result */
	ldr 	%r1, num_addr /* load the adress of num */
	ldr  	%r1, [%r1] /* load the number instead of the adress */
	mov		%r2, %r1 /* create a tmp var */

/* check if we are in the fact(1) case */
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

	/* before close the program we want to store the var */
	ldr 	%r1, num_addr /* load the adress of num */
	str 	%r0, [%r1] /* load into ram at r1 adress */


	/* syscall exit(status) */
	mov		%r0, $0		/* status -> 0 */
	mov		%r7, $1		/* exit is the syscall 1 */
	swi		$0			/* invoke syscall */

