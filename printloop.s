! simple program to print from 1 to 5

	EOL = 10		! End of line character 

	.global main

main:	save	%sp, -96, %sp

  	mov	1, %l0		! start number at 1

loop:	subcc	%l0, 5, %g0	! compare number to 5
	bg	done		! if > 5, done
	nop

	mov	%l0, %o0	! get number for printing
	call	writeInt	! print it
	nop
	
	mov	EOL, %o0	! print newline
	call	writeChar
	nop

	inc	%l0		! increment number
	
	ba	loop		! loop back 
	nop

done:	ret
	restore
