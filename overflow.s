! Reads an integer from the keyboard (no prompt is printed) and
! increments it.  Used for learning gdb and exploring signed vs.
! unsigned overflow.

	.global main
main:
	save	%sp, -96, %sp

	call	readInt		! Read an integer from the user
	nop

	inccc	1, %o0		! Increment and modify condition codes

	ret
	restore
