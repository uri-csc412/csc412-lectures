#!/bin/bash

# run program1 and program2, redirecting output to temporary files


# use diff to compare the output files
if cmp -s <(echo "hih mom") <(echo "hih momsss"); then
    file_diff=$(cmp -s <(echo "hih mom") <(echo "hih momsss"))
    echo files_same
else
    file_diff=$(cmp -s <(echo "hih mom") <(echo "hih momsss"))
    echo $file_diff
    echo files_different
fi

# cleanup temporary files
# rm output1.txt output2.txt