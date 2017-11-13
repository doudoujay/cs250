.data
.balign 4
hex: .asciz "0123456789ABCDEF"

.text
.global printd
.global printx
printx:
	/*r0: integer*/
	push {r4,r5,r6,fp,lr}
	mov fp, sp
	mov r4, r0 @save the result from r0
	
	@
	mov r5, #28
	
	@mask with 111100.....00
	mov r6, #0xF0000000 


		
	
	
zero:
	ands r3, r6, r4 @mask r6 to integer r4
	bne digit
	
	lsr r6, r6, #4  @logical shift right 4 digits for mask
	
	subs r5, r5, #4 @
	bpl zero @ positive or zero, which will leads to 8 times

	
digit:
	and r0, r4, r6 @ mask r6 and r4
	lsr r0, r0, r5 @ logical shift right by amount of r5
	ldr r2, =hex
	add r0, r0, r2 @ r0+=r2
	ldrb r0, [r0]
	bl putchar
	lsr r6, r6, #4 @logical shift right 4 digits for mask
	subs r5, r5, #4 @
	bpl digit @ @ positive or zero,branch
	
mov sp, fp
pop {r4,r5,r6,fp,pc}
	
loop_mod:
	@mod and save the result
	mov r0, r4
	b s_mod_by_16
	mov r5, r0 
	
s_divide_by_16:
   /* r0 contains the argument to be divided by 16 */
   ldr r1, .Ls_magic_number_16 /* r1 ← magic_number */
   smull r1, r2, r1, r0   /* r1 ← Lower32Bits(r1*r0). r2 ← Upper32Bits(r1*r0) */
   add r2, r2, r0         /* r2 ← r2 + r0 */
   mov r2, r2, ASR #3     /* r2 ← r2 >> 3 */
   mov r1, r0, LSR #31    /* r1 ← r0 >> 31 */
   add r0, r2, r1         /* r0 ← r2 + r1 */
   bx lr                  /* leave function */
   .align 4
   .Ls_magic_number_16: .word 0x80000001
   
s_mod_by_16:
	/* r0 contains the argument to be mod by 16 */
	mov r2, r0
	b s_divide_by_16
	mov r3, #16
	mul r1, r0, r3
	sub r0, r2, r1
	bx lr


printd:
	/*r0: integer*/
	push {fp,lr}
	mov fp, sp

	
	mov sp, fp
	pop {fp, pc}