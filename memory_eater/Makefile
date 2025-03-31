build: clean build-main build-write build-pointers

build-main:
	gcc -o main main_write.c

build-write:
	gcc -o main_write main_write.c

build-pointers:
	gcc -o main_pointers main_pointers.c

clean:
	rm -f main && rm -f main_write && rm -f main_pointers