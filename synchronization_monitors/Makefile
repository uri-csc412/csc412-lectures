remake: clean build run

build:
	g++ -std=c++20 -pthread -o main main.cpp

run: 
	./main

clean: main-exists
	rm main

main-exists:
	touch main