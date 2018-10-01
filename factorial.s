.text
.global _start
.org 	0x0000

_start:							# This program will compute the factorial of a number n recursively
	ldw		r2, N(r0)			# Load the n into the processor
        mov		r4, r0				# r4 will be used for accumulation in MULTIPLY subroutine
        mov		r5, r2				# Duplicate n for iterating through the factorial
        movi		r6, 1				# A register to store the number 1 (for the exit condition of the factorial)

FACTORIAL:
		subi	r5, r5, 1			# Subtract one from the iterator
        ble		r5, r6, FINISH			# If the iterator is <=1, we are done
        mov		r3, r5				# Move the iterator into the proper register to multiply
        br		MULTIPLY			# Multiply r2 by the iterator (now in r3)
        
MULTIPLY:						# A subroutine to multiply r2 by r3 and store it in r2
	subi	r3, r3, 1				# Decrement the iterator
	add 	r4, r4, r2				# Add the number being multiplied into the accumulator
        bgt		r3, r0, MULTIPLY		# Continue with the multiplication until the iterator is 0
        mov		r2, r4				# Move the accumulated
        movi		r4, 0				# Reset the accumulator
        br		FACTORIAL			# Continue with the factorial

FINISH:
	stw		r2, RESULT(r0)			# Store the result in memory
_end:
	br		_end
        
#-----------------------------

		.org 	0x1000
RESULT:	.skip	4
N:		.word	5
		.end
