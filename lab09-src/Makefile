test: main debug
run: main
	./main
main: main.c
	gcc main.c -std=c99 -g -o main
debug:
	gdbgui main
clean:
	rm -f main
