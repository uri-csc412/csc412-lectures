hello: world
	./world

world: myprog.c
	gcc -Werror -Wall -o world myprog.c

myprog.c:
	echo "#include <stdio.h> \n int main() { \n printf(\"Hello World\"); \n return 0; \n }" > myprog.c

clean: # Remove all files created by this Makefile

