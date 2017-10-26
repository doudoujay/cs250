.data
.balign 4
print_pattern_1: .asciz "Enter your frist name: "

.balign 4
print_pattern_2: .asciz "Enter your last name: "

.balign 4
print_pattern: .asciz "Hello, %s %s.\n"

.balign 4
scan_pattern: .asciz "%s" @scan the string

.balign 4
str_1: .word 0

.balign 4
str_2: .word 0

.text
.global main
main:
	@Print the prompt one
	ldr r0, =print_pattern_1
	bl printf
	@Read from user input, and store in str_1
	ldr r0, =scan_pattern
	ldr r1, =str_1
	bl scanf

	@Print the prompt two
	ldr r0, =print_pattern_2
	bl printf
	@Read from user input, and store in str_2
	ldr r0, =scan_pattern
	ldr r1, =str_2
	bl scanf

	@print the hello prompt
	ldr r0, =print_pattern
	ldr r1, =str_1
	ldr r2, =str_2
	bl printf
	bl exit

/*Exit*/
exit:
	mov r7, $1
	svc $0
