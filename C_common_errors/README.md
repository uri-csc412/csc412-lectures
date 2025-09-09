## Overview

See lecture slides for `Docker and OS Structures` for Common Errors in C:

In this folder you will find the original `_err.c` error filled code and the solution code as `_sol.c`

##### Buffer Overflows (bufferoverflow)
Writing more data into a buffer (array) than it can hold, leading to memory corruption and undefined behavior.

##### Null-Termination Issues (nullterm)
If C strings are not properly null-terminated, this can cause errors when using standard functions that expect null-terminated strings.

##### Off-by-One Errors (offbyone)
Accessing or manipulating string characters with incorrect indices, often leading to reading or writing memory outside the string's bounds.
> AKA: out of bounds

##### Uninitialized Pointers (uninitptr)
Using pointers that are not properly initialized, leading to unpredictable behavior or crashes.


## How to run?

See the makefile for commands:
```
make build-buff
```

And to run the bufferoverflow:
```
make run-buff
```

Tab completions work for make commands. ;)