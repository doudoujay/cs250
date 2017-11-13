all: twelvedaystest maintest

twelvedaystest: twelvedays.c myprintf.c printinteger.s
	gcc twelvedays.c myprintf.c printinteger.s -std=c99 -g -o twelvedaystest

maintest: main.c myprintf.c printinteger.s
	gcc main.c myprintf.c printinteger.s -std=c99 -g -o maintest
testinc: test.c myprintf.c printinteger.c
	gcc test.c myprintf.c printinteger.c -std=c99 -g -o test
testins: test.c myprintf.c printinteger.s
	gcc test.c myprintf.c printinteger.s -std=c99 -g -o test
clean:
	rm -f maintest twelvedaystest
debug:
	python ~/Documents/gdbgui/gdbgui/backend.py -r test
