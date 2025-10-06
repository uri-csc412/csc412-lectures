#!/bin/bash

# compiler and then our flags
CXX=g++
CXXFLAGS="-Wall -Wextra -pedantic -std=c++2a -g -O3"

compile() {

    local SRC_FILE=$1

    # remove .cpp extension for output file
    local OUT_FILE=${SRC_FILE%.cpp}  

    echo "Compiling $SRC_FILE..."
    $CXX $CXXFLAGS -o $OUT_FILE $SRC_FILE
    if [ $? -eq 0 ]; then
        echo "   Compilation successful: $OUT_FILE"
    else
        echo "   Compilation failed: $SRC_FILE"
        exit 1
    fi
}

compile "good_example.cpp"
compile "bad_example.cpp"

echo "Ah yeah, all done!"
