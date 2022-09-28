@   prog6.s
@   6x^2 + 9x + 2
@	4 operations
@ ---------------------------------------
@   Data Section
@ ---------------------------------------
	
.data
string1: .asciz "\n6x^2 + 9x + 2:\n"
string2: .asciz "\nEnter x:\n"
string3: .asciz "\nThe result is: %d\n"
format:	.asciz	"%d"
x:	 .int	 0	
res:   .int    0


@ ---------------------------------------
@   Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf

main:
@ PRIMER PROMPT
	push 	{ip, lr}	@ push return address + dummy register for alignment

	ldr	r0, =string1	@ print the prompt
	bl	printf
	
	ldr	r0, =string2	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =x			@ string and address of n in r0, and r1,			
	bl	scanf			@ respectively.

	@ OPERATION
    Ldr r1, =x          @ print num formatted by output string.
    Ldr r1, [r1]

	@6x = a           r3 = a
	mov r2, #6 
	mul r3, r2, r1

	
	@a*a = b           r4 = b
	mul r4, r3, r3      
	
	@9x = c            r5 = c
	mov r2, #9
	mul r5, r2, r1
	
	@b+c = d           r6 = d
	add r6, r4, r5
	
	@d + 2 = resultado
	mov r5, #2
	add r1, r6, r5
	
	
	
@ RESULTADO FINAL
    ldr r0, =string3
    bl  printf    
	
    pop {ip, pc}
