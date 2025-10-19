remake: clean build run

build:
	gcc -fno-stack-protector -z execstack -o main main.c

run: 
	./main

clean:
	@[ -f main ] && rm main || true
