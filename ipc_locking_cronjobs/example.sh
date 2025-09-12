#!/bin/bash

# Run program1 and program2, redirecting output to temporary files


# Use diff to compare the output files
if cmp -s <(echo "hih mom") <(echo "hih momsss"); then
    file_diff=$(cmp -s <(echo "hih mom") <(echo "hih momsss"))
    echo files_same
else
    file_diff=$(cmp -s <(echo "hih mom") <(echo "hih momsss"))
    echo $file_diff
    echo files_different
fi

# Cleanup temporary files
# rm output1.txt output2.txt