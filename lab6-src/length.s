@Write a program length.s that reads a string from stdin and prints the length of the string.
@You cannot use the C library function “strlen” in this assignment.
@The length of the string is guaranteed to be less than 100 characters long,
@and there will be no white space. Type the string in the terminal and output the length to the terminal.
@An example output is shown below.
.data

.balign 4
len: .word 0 /*var for storing the length*/

.balign 4
scan_pattern: .asciz "%s" /*scan string*/

.balign 4
print_pattern: .asciz "%d\n" /*print integer*/

.balign 4
input: .word 0 /*Input string*/

.text
.global main

getLen:
	/*r0 is string pointer, r1 is length counter*/
	ldr r2, [r0] @load r0 character by character
	cmp r2, #0 @if r2 is 0
	beq end @ branch to end, and end the loop

	add r0,r0,#1 @increment string pointer by one
	add r1,r1,#1 @increment len counter by one

	str r1,[r5] @store length to len pointer

	b getLen @loop back to start

	
end:
	/*Print the result*/
	/*only r1(length value) is needed*/	
	ldr r0, =print_pattern @pass formate to r0
	bl printf
	bl exit


exit:
	/*Exit*/
	mov r7,$1
	svc $0
	
main:
	/*read from scanf*/
	ldr r0, =scan_pattern
	ldr r1, =input
	bl scanf



	ldr r5, address_of_len @load length pointer to r5

	ldr r0, address_of_input  @r0 is string pointer
	ldr r1, [r5] @r1 is len value
	bl getLen

/*address declaration*/
address_of_input: .word input
address_of_len: .word len
	
/* External*/
.global printf
.global scanf
