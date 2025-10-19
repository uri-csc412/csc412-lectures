### hacking buffer overflow attack!

We get our message!
./main passw0rd extra

What do we need to run to make it break? (password needs to appended to the end to overwrite)
./main myfakepwd 0123456789012345myfakepwd

If you can overwrite password, you can potentially bypass authentication. ;)

### we need to disable some stack protection

Compiler optimizations and stack alignment can affect where buffer and password are placed.

You can try disabling stack protection with:
```
gcc -fno-stack-protector -z execstack -o main main.c
```

### strings

csc412-user@c44df2bbf71b:~/lectures/hacking$ strings main
usage %s <password> <string_to_print>
password checks out
MSG: %s
password error!
message
passw0rd


### objdump to get the symbols table

csc412-user@c44df2bbf71b:~/lectures/hacking$ objdump -t ./main

./main:     file format elf64-littleaarch64

SYMBOL TABLE:
0000000000000000       F *UND*  0000000000000000              __libc_start_main@@GLIBC_2.17
0000000000011020 g     O .data  000000000000000a              password
0000000000011010 g     O .data  000000000000000a              buffer
0000000000011000 g       .data  0000000000000000              __data_start


### FIX to help prevent the attack. ;)
strncpy(buffer, argv[2], BUFFERSIZE); // good :)


### source

Part of this example was dervided from Dr. Jacob Sorber's YouTube channel from Clemson:
https://www.youtube.com/watch?v=7mKfWrNQcj0&t=301s&ab_channel=JacobSorber

