all: build run

run: build
	./zombie

run1: build
	./zombie1

run2: build
	./zombie2

build:
	gcc -o zombie main.c
	gcc -o zombie1 main_1start.c
	gcc -o zombie2 main_2reap.c

clean:
	rm zombie*