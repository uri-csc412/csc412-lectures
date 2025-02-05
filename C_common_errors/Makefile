run-buff: build-buff
	./bufferoverflow_err

build-buff:
	gcc -Wall -Werror -o bufferoverflow_err bufferoverflow_err.c

run-nullterm: 
	./nullterm_err

build-nullterm:
	gcc -Wall -Werror -o nullterm_err nullterm_err.c

run-ptr:
	./uninitptr_err

build-ptr:
	gcc -Wall -Werror -o uninitptr_err uninitptr_err.c

clean:
	rm bufferoverflow_err uninitptr_err nullterm_err