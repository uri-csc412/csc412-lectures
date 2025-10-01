#!/bin/bash

# compiler and then our flags
CXX=gcc
CXXFLAGS="-Wall -Wextra -pedantic"

compile() {

    local SRC_FILE=$1

    # remove .cpp extension for output file
    local OUT_FILE=${SRC_FILE%.c}  

    echo "Compiling $SRC_FILE..."
    $CXX $CXXFLAGS -o $OUT_FILE $SRC_FILE
    if [ $? -eq 0 ]; then
        echo "   Compilation successful: $OUT_FILE"
    else
        echo "   Compilation failed: $SRC_FILE"
        exit 1
    fi
}

compile "synchronous.c"
compile "asynchronous.c"

echo "Ah yeah, all done!"
