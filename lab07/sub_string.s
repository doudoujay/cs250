.data
.balign 4
result: .word 0

.text


sub_string:      
  /*r0: string pointer, r1: start index, r2: end index*/
  @ calcualate length for r4
  sub r4, r2, r1
  add r4, r4, #1

  @use r5 to store starting pointer r5=r0+r1
  add r5, r0, r1
  @use r9 to store ending pointer 
  add r9, r0, r2

  @result register
  ldr r8, =result
  
  /* Code to extract the sub-string */
  bl loop

  mov r0,r8
  bx lr @return from the function
  
  

  /* Suitable code to return the sub-string */
loop:
  mov r6, #0 @index initialized
  ldrb r7, [r5], #1 @ldr byte in r5 and r5++
  strb r7, [r8], #1 @store byte located in r7 to r8, and r8++  
  
  @loop control
  cmp r5, r9 @starting index less than ending index
  blt loop @branch less than
  

.global sub_string
