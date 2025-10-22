remake: clean build run

build: global_local pointers

global_local:
	gcc -Wall -Werror -fno-stack-protector -z execstack -o global_local global_local.c

pointers:
	gcc -Wall -Werror -fno-stack-protector -z execstack -o pointers pointers.c

run: run_global_local run_pointers

run_global_local: 
	./global_local

run_pointers: 
	./pointers

clean:
	@rm -f global_local pointers
