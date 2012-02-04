! ******************************************************************************
! calls the function store, which stores a few values to RAM.  intended to be
! used in the gdb lab to demonstrate stepping into functions and viewing memory
! addresses.
! ******************************************************************************

! ******************************************************************************
! static variable declarations
! ******************************************************************************

            .data

char_m:     .byte   0               ! reserve space for a byte

            .align  4
value_m:    .word   0               ! reserve space for a word

! ******************************************************************************
! main program bebegins
! ******************************************************************************

            .text

            .global main
main:       save    %sp, -96, %sp

            call    store           ! call the store function
            nop

            set     char_m, %l0     ! set address of character
            ldub    [%l0], %o0      ! load character

            call    writeChar       ! and display it
            nop

            call    writeChar       ! print a new line character
            mov     '\n', %o0

            ret
            restore

! ******************************************************************************
! function that stores a few values into the static variables declared above
! ******************************************************************************

            .global store
store:      save    %sp, -96, %sp   

            set     char_m, %l0     ! set the RAM address of the byte into %l0
            mov     'A', %l1        ! prepare to store 'A' in RAM
            stub    %l1, [%l0]      ! store 'A' in RAM at the address of the byte

            set     value_m, %l0    ! set the RAM address of the word into %l0
            set     0xDEADBEEF, %l1 ! set 0xDEADBEEF into %l1
            st      %l1, [%l0]      ! ...and store it into the word in RAM

            ret
            restore     
