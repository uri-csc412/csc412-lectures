remake: clean build run

build:
	gcc -Wall -Werror -pedantic -o main main.c
	gcc -Wall -Werror -pedantic -o readonly readonly.c

run: 
	./main

run-readonly:
	./readonly

clean:
	@[ -f main ] && rm main || true
	@[ -f readonly ] && rm readonly || true
	