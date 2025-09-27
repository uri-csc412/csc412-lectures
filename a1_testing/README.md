# Use the GNU Util diff to Test

`diff` will allow you to compare the output of your programs with eachother or other programs. For example in A1, compare your sort.sh with the output of the actual sort program. ;)

**Try running these:**

```bash
./diff_example.sh same1.sh same2.sh 

./diff_example.sh same1.sh different.sh
```

For A1 you could run:
```bash
diff -c <(echo "bob lily alice" | ./sort.sh) <(echo "bob lily alice" | sort)
```

## More About Comparing Program Outputs with `diff`

The `diff` command is a Unix tool that highlights line-by-line differences between two files or outputs.  

We are using the `diff` command to compare the results (stdout) of two programs. You can use this to verify whether two implementations produce the same output. Handy for catching those tiny little differences. ;)

### Usage

Run the script with two executables as arguments:

```bash
./diff_example.sh program1 program2.sh
```