# Use the GNU Util diff to Test

`diff` will allow you to compare the output of your programs with eachother or other programs. For example in A1, compare your sort.sh with the output of the actual sort program. ;)

**Try running these:**

```bash
./diff_example.sh same1.sh same2.sh 

./diff_example.sh same1.sh different.sh
```

For A1 you could run:
```bash
diff -c <(printf "bob\nlily\nalice\n" | ./sort.sh) <(printf "bob\nlily\nalice\n" | sort)
```

If you see this... it is good ;)
```bash
csc412-user@271a3c95e0af:~/assignments/a1_unix/solution2/programs$ diff -c <(printf "bob\nlily\nalice\n" | ./sort.sh) <(printf "bob\nlily\nalice\n" | sort)
csc412-user@271a3c95e0af:~/assignments/a1_unix/solution2/programs$ 
```

That is actually the best case, woot: it means the output of your custom script sort.sh is identical to the output of the system’s sort command for the given input: 
```
bob
lily
alice
```

If there had been any differences, you would have seen a context diff with *** and --- headers plus the mismatched lines.

How to interpret diff's outputs:
* Empty diff output = no differences.
* Non-empty diff output = mismatches shown.

## More About Comparing Program Outputs with `diff`

The `diff` command is a Unix tool that highlights line-by-line differences between two files or outputs.  

We are using the `diff` command to compare the results (stdout) of two programs. You can use this to verify whether two implementations produce the same output. Handy for catching those tiny little differences. ;)

### Usage

Run the script with two executables as arguments:

```bash
./diff_example.sh program1 program2.sh
```