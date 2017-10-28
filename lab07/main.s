.section	.data
.balign 4
print_1: .asciz "Enter a string: "

.balign 4
print_2: .asciz "Enter the start index: "

.balign 4
print_3: .asciz "Enter the end index: "

.balign 4
print_result: .asciz "The substring of the given string is '%s'"

.balign 4
input: .word 0

.balign 4
scan_string: .asciz "%s" @scan string

.balign 4
scan_int: .asciz "%d" @scan int

.balign 4 
index_1: .word 0

.balign 4
index_2: .word 0

.section	.text	
.global		main
main:
  @Print the prompt one
  ldr r0, =print_1
  bl printf
  @Read from user input, and store in input
  ldr r0, =scan_string
  ldr r1, =input
  bl scanf

  @Print the prompt two
    ldr r0, =print_2
    bl printf
    @Read from user input, and store in index_1
    ldr r0, =scan_int
    ldr r1, =index_1
    bl scanf

    
      @Print the prompt three
        ldr r0, =print_3
        bl printf
        @Read from user input, and store in index_2
        ldr r0, =scan_int
        ldr r1, =index_2
        bl scanf
	
	nop		@no operation
	mov r7, $1	@exit syscall
	svc $0		@wake kernel
	.end
	