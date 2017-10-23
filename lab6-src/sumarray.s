@Write a program sumarray.s that reads 5 numbers from stdin and prints the sum of the numbers.
@Use a loop to read in the 5 numbers so that your code could handle a larger or smaller number of input numbers.
@For example, a loop would look like this. In other words,
@do not copy/paste the scanf and format character 5 times in your program.
.data


@Variable for print and scan pattern
.balign 4
scan_pattern: .asciz "%d"
.balign 4
print_pattern: .asciz "%d\n"

@Temp value
temp: .word 0

@Result value
result: .word 0



.text
.global main

/*EXIT the program*/
exit:
	mov r7, $1
	svc $0
	
/*Read inputs from scanf*/
readInputs:
	/*Loop control*/
	sub r3, r3, #1 @r3--
	cmp r3, #0 @if the loop times goes from 5 to 0
	blt end @break the loop and branch to sum
	
	/*Read from scanf*/
	ldr r0, =scan_pattern
	ldr r1, =temp
	bl scanf

	add r4, r4, r1 @r4+=r1
	
	b readInputs @go back to loop
	

/*print result*/
end: 
	ldr r0, =print_pattern
	mov r1, r4
	bl printf
	bl exit
	
main:
	mov r3,#2 @load looptimes to control the loop
	ldr r4, =result @load result value to r4
	bl readInputs
