all: clean build run

run_zombie: build
	./zombie

run_fork_bomb: build
	./fork_bomb

build:
	gcc -Wall -o zombiec main.c
	g++ -o zombie main.cpp
	g++ -o fork_bomb fork_bomb.cpp

clean:
	rm zombiec
	rm zombie
	rm fork_bomb