@ prog5.s
@   Sum two numbers
@	4 operations
@ ---------------------------------------
@   Data Section
@ ---------------------------------------
	
.data
string1: .asciz "\nEnter the first operand:\n"
string2: .asciz "\nEnter the operation to be performed (+, - , *, /):\n"
string3: .asciz "\nEnter the second operand:\n"
string4: .asciz "\nEnter the operation to be performed (+, - , *, /):\n"
string5: .asciz "\nEnter the third operand:\n"
string6: .asciz "\nThe result is: %d\n"
format:	.asciz	"%d"
n:	 .int	 0	
m:   .int    0
op1: .int    0
k:   .int    0
op2: .int    0
x:   .int    0

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

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =n			@ string and address of n in r0, and r1,			
	bl	scanf			@ respectively.

@ SEGUNDO PROMPT 

	ldr	r0, =string2	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =op1   		@ string and address of n in r0, and r1,
	bl	scanf			@ respectively.

@ TERCER PROMPT 

	ldr	r0, =string3	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =m   		@ string and address of n in r0, and r1,
	bl	scanf			@ respectively.

@ OPERATION
    Ldr r1, =n        @ print num formatted by output string.
    Ldr r1, [r1]
    Ldr r2, =op1
    Ldr r2, [r2]
    Ldr r3, =m        @ print num formatted by output string.
    Ldr r3, [r3]

@-----------------------------------------------------------------
    
    subs r7, r2, #1	  @Check if operatiion is a sum 
    beq ADD
    
    subs r7, r2, #2   @Check if operation is a sub
    beq SUB
    
    subs r7, r2, #3	  @Check if operation is a mul
    beq MUL
    
    subs r7, r2, #4	  @Check if operatin is a div
    beq	DIV

@-----------------------------------------------------------------
    
ADD:    @Perfmorm addition and jump to RES
	add	r4, r1, r3      @ r4 = r1+r2
	b RES
	
SUB:	@Perform substraction and jump to RES
	sub r4, r1, r3
	b RES

MUL:	@Perform multiplication and jump to RES
	mul r4, r1, r3
	b RES
	
DIV:

	b RES

@-----------------------------------------------------------------

@ RESULTADO TEMPORAL ANTES DEL TERCER OPERANDO
RES:
	@mov r1, r4  @resultado esta en r4
	
@ CUARTO PROMPT - TERCER OPERANDO

	ldr	r0, =string4 	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =op2   		@ string and address of n in r0, and r1,
	bl	scanf			@ respectively.

@ QUINTO PROMPT 
    
	ldr	r0, =string5	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =k   		@ string and address of n in r0, and r1,
	bl	scanf			@ respectively.
	
	
@ OPERATION
    @Ldr r1, =n        @ print num formatted by output string.
    @Ldr r1, [r1]
    Ldr r2, =op2
    Ldr r2, [r2]
    Ldr r3, =k       @ print num formatted by output string.
    Ldr r3, [r3]

@-----------------------------------------------------------------
    
    subs r7, r2, #1	  @Check if operatiion is a sum 
    beq ADD2
    
    subs r7, r2, #2   @Check if operation is a sub
    beq SUB2
    
    subs r7, r2, #3	  @Check if operation is a mul
    beq MUL2
    
    subs r7, r2, #4	  @Check if operatin is a div
    beq	DIV2

@-----------------------------------------------------------------
    
ADD2:    @Perfmorm addition and jump to RES
	add	r1, r4, r3      @ r4 = r1+r2
	b RESFINAL
	
SUB2:	@Perform substraction and jump to RES
	sub r1, r4, r3
	b RESFINAL

MUL2:	@Perform multiplication and jump to RES
	mul r1, r4, r3
	b RESFINAL
	
DIV2:


	b RESFINAL

@-----------------------------------------------------------------

    
RESFINAL:	
@ SEXTO PROMPT CON RESULTADO 
    @mov r1, r4  @resultado esta en r4
    ldr r0, =string6
    bl  printf    
	
    pop {ip, pc}
    
