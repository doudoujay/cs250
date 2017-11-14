test: main debug
run: main
	./main
main: main.c
	gcc main.c -std=c99 -g -o main
debug:
	python ~/Documents/gdbgui/gdbgui/backend.py main
clean:
	rm -f main
