/* author http://peterdn.com */
.data

msg:
	.ascii	"Hello, nerdz \n"
len = . - msg

.text

.global _start

_start:
	/* syscall write(int fd, const void *buf, size_t count) */
	mov		%r0, $1   	/* fd -> stdout */
	ldr		%r1, =msg   /* buf -> msg  */
	ldr		%r2, =len	/* count -> len(msg) */
	mov		%r7, $4		/* call write() */
	swi		$0			/* invoke syscall */

	/* syscall exit(status) */
	mov		%r0, $0		/* status -> 0 */
	mov		%r7, $1		/* exit is the syscall 1 */
	swi		$0			/* invoke syscall */
