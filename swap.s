/* swap 2 registers 
*  can be executed with gdb
*/

.global _start

_start:
	/* initialize */
	mov %r0, $5 /* first number in register r0 */ 
	mov %r1, $6 /* second number in register r1*/
	
	/* scambio */
	mov %r2, %r0 /* r2 is the temp variable */
	mov %r0, %r1
	mov %r1, %r2
 
	/* syscall exit(status) */
	mov		%r0, $0		/* status -> 0 */
	mov		%r7, $1		/* exit is the syscall 1 */
	swi		$0			/* invoke syscall */
	