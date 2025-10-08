#!/bin/bash

compile() {
    gcc -std=c17 -pedantic-errors -O0 -g -S mutex.c 
    as --gstabs -o mutex.o mutex.s 
    gcc -o mutex mutex.o -lpthread
}

compile "murex.c"

echo "Ah yeah, all done!"
