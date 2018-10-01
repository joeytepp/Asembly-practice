.text
.global _start
.org 	0x0000

_start:
	ldw	r2, N(r0)       # Load r2 with the number of elements
        movi	r3, LIST        # Store a pointer to the list of numbers in r3
        movi	r4, 0           # Initialize r4 to zero, will accumulate the sum
        
LOOP:
	ldw		r5, 0(r3)       # Load r5 with the address of the next element
        add		r4, r4, r5      # Add the element to the accumulated sum
        addi		r3, r3, 4       # Go to the next element in the list
        subi		r2, r2, 1       # Decrement the iterator
        bgt		r2, r0, LOOP    # Continue the loop based on the iterator
        
        stw		r4, SUM(r0)     # After the loop has executed, store the sum in memory
        
_end:
	br		_end
        
#-----------------------------

.org 	0x1000
SUM:	.skip	4
N:	.word	5
LIST:	.word	12, 0xFFFFFFFE, 7, -1, 2
.end
