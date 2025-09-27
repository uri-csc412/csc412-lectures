hello: world
	./world

world: myprog.c
	gcc -Werror -Wall -o world myprog.c

myprog.c:
	echo "#include <stdio.h> \n int main() { \n printf(\"Hello Mom\"); \n return 0; \n }" > myprog.c

run: # Run the program
	./world

clean: # Remove all files created by this Makefile
	rm -rf world myprog.c
