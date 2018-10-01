.text
.global _start
.org 	0x0000

_start:					# This program will compute the maximum and mininum from a list
	ldw		r2, N(r0)	# The number of elements in the list	
        movi	        r3, LIST	# A pointer to the first element of the list
        ldw		r4, 0(r3)	# r4 will store the smallest number
        ldw		r5, 0(r3)	# r5 will store the largest number
        subi 	        r2, r2, 1	# Decrement iterator
        addi	        r3, r3, 4	# Get next element
        

        
LOOP:
	ldw		r6, 0(r3)	# Load next element
        bgt		r6, r5, BIGGER	# New maximum
        blt		r6, r4, SMALLER	# New minimum
        br		CONTINUE

BIGGER:
	ldw		r5, 0(r3)       # Update maximum
        br		CONTINUE

SMALLER:
        ldw		r4, 0(r3)	# Update minimum
        br		CONTINUE

CONTINUE:
        addi	        r3, r3, 4	# Get next element
        subi	        r2, r2, 1	# Decrement iterator
        bgt		r2, r0, LOOP	# Continue the loop
        

        
_end:
	br		_end
        
#-----------------------------

.org 	0x1000
SUM:	.skip	4
N:	.word	5
LIST:	.word	0xFFFFFFFF, 0x7FFFFFFF, -6, 9, 5
.end
