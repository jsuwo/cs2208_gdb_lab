
	.global main
main:
	save	%sp, -96, %sp

	call	readInt
	nop

	inccc	1, %o0

	ret
	restore
