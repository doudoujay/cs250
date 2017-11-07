.data
.balign 4
equal: .asciz "%d and %d are equal.\n"

@max{x, y} is strictly greater than min{x, y} by |x − y|.
.balign
print_result: .asciz "%d is strictly greater than %d by %d.\n"

.balign 4
print_pattern_1: .asciz "Enter the first number: "

.balign 4
print_pattern_2: .asciz "Enter the second number: "

.balign 4
scan_pattern: .asciz "%d" @scan int

.balign 4
num_1: .word 0

.balign 4
num_2: .word 0

.text
.global main
main:
  @Print the prompt one
  ldr r0, =print_pattern_1
  bl printf
  @Read from user input, and store in num_1
  ldr r0, =scan_pattern
  ldr r1, =num_1
  bl scanf

  @Print the prompt two
  ldr r0, =print_pattern_2
  bl printf
  @Read from user input, and store in num_2
  ldr r0, =scan_pattern
  ldr r1, =num_2
  bl scanf

  @load num1 and num2 to r4 and r5, first load address, then load value
  ldr r4, =num_1
  ldr r4, [r4]
  ldr r5, =num_2
  ldr r5, [r5]
  
  cmp r4, r5
  blt less_print @if r4<r5
  beq equal_print @if r4 is equal to r5
  bgt greater_print @if r4>r5

equal_print:
  @print if beq
  ldr r0, =equal
  mov r1, r4
  mov r2, r5
  bl printf
  b exit

less_print:
  @r4 is less than r5
  sub r6, r5, r4 @ r6=r5-r4
  
  @print
  ldr r0, =print_result
  mov r1, r5
  mov r2, r4
  mov r3, r6
  bl printf
  b exit

greater_print:
  @r4 is greater than r5
  sub r6, r4, r5 @r6=r4-r5

  @print
  ldr r0, =print_result
  mov r1, r4
  mov r2, r5
  mov r3, r6
  bl printf
  b exit
  


/*Exit*/
exit:
	mov r0,$0
	bl fflush
	mov r7, $1
	svc $0
