.data

.text


sub_string:      
  /*r0: string pointer, r1: start index, r2: end index*/
  push {fp,lr}
  mov fp, sp
  @ calcualate length for r4
  sub r4, r2, r1
  add r4, r4, #1

  @use r5 to store starting pointer r5=r0+r1
  add r5, r0, r1
  sub r5, r0, #1
  @use r9 to store ending pointer 
  add r9, r0, r2
  
  @malloc
  mov r0, r4
  bl malloc

  @result register
  mov r8, r0
  
  /* Code to extract the sub-string */
  bl loop

  sub r8,r8,r4
  mov r0,r8
  
  mov sp, fp
  pop {fp, pc}
  
  

  /* Suitable code to return the sub-string */
loop:
  ldrb r7, [r5]  @ldr byte in r5
  strb r7, [r8]  @store byte located in r7 to r8  
  @r5++ r8++
  add r5, r5, #1
  add r8, r8, #1
  
  @loop control
  cmp r5, r9 @starting index less than ending index
  blt loop @branch less than
  

.global sub_string
