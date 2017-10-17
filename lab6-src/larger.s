@Write a program larger.s that reads two numbers from stdin, and prints the larger of the two numbers.
@The numbers can be positive, negative, or zero. To input the numbers to your program,
@you can use 'scanf' or something similar. Type one number followed by the enter key,
@then type the second number followed by the enter key, and then print the result to the
@terminal by using 'printf' or something similar. An example of what the output should look like is shown below.
.data

.balign 4
scan_pattern : .asciz "%d" /*scan pattern*/

.balign 4
num_one: .word 0 /*var for scanf input one*/

.balign 4
num_two: .word 0 /*var for scanf input two*/

.balign 4
print_pattern: .asciz "%d\n" /*print pattern*/

.text
.global main

main:
  /*Read first input*/
  ldr r0, =scan_pattern
  ldr r1, =num_one
  ldr r4, r1 //store r1 in r4
  ldr r4, [r4] //store val in r4
  /*Read second input*/
  ldr r0, =scan_pattern
  ldr r1, =num_two
  bl scanf
  ldr r5, r1 //store r1 in r5
  ldr r5, [r5] //store val in r5

  /*if else statements*/
  cmp r4, r5
  blt print_second //if r4(first num) is less than r5(second num)
  bl print_first




/*print the first result*/
print_first:
  ldr r0, =print_pattern
  ldr r1, r4
  bl print



/*print the second result*/
print_second:
  ldr r0, =print_pattern
  ldr r1, r5
  bl print




/* External */
.global printf
.global scanf
