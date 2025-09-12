#!/bin/bash

# check for two args
if [ "$#" -ne 2 ]; then
    echo "Pass each program or script as an argument: $0 program1 program2.sh"
    echo "we assume these are in the current directory..."
    exit 1
fi

# diff <(program1) <(program2)
diff -c <(./$1) <($2)
