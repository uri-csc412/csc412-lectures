build-all: build-num build-pointer build-struct

build-num:
	gcc -Wall -Werror -o main_num main_num.c

run-num: 
	./main_num

build-pointer:
	gcc -Wall -Werror -o main_pointer main_pointer.c

run-pointer: 
	./main_pointer

build-struct:
	gcc -Wall -Werror -o main_struct main_struct.c

run-struct: 
	./main_struct

clean:
	rm main_num main_pointer main_struct