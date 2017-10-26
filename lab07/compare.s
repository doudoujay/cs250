.data
.balign 4
equal: .asciz "x and y are equal.\n"

@max{x, y} is strictly greater than min{x, y} by |x − y|.
.balign
print_result: .asciz "%d is strictly greater than %d by %d.\n"

.balign 4
print_pattern_1: .asciz "Enter the first number: "

.balign 4
print_pattern_2: .asciz "Enter the second number: "

.balign 4
scan_pattern: "%d" @scan int

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


/*Exit*/
exit:
	mov r7, $1
	svc $0
