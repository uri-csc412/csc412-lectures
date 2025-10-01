# threads and concurrency

If you want concurrency in plain C, you need a threading library. On Unix/Linux systems (like our course dev env) that is almost usually ≈s (pthread), which is what I showed you earlier. On Windows you’d typically use the Win32 threads API.


### what is POSIX thread?

A POSIX thread (aka a pthread), is a standardized application programming interface (API) to create and manage threads within a process. 

It is defined by the `IEEE POSIX.1c standard` (Threads extensions) and provides a portable way to implement multithreaded applications on various Unix-like operating systems.

https://standards.ieee.org/ieee/1003.1/7700/


### a sign of asynchronous code :/

For `asynchronous.c` look at `pthread_join`.

```
//pthread_join(t1, NULL);
//pthread_join(t2, NULL);
```

### why do we have `return NULL;`

We are using POSIX threads (pthread).

In a pthread, a thread start routine must match this prototype:
```
void* start_routine(void* arg);
```

That means:
* The function must return a void* (a generic pointer).
* The return value is the “exit status” of the thread, which can be retrieved later with pthread_join.

So, even if your thread function doesn’t actually need to return anything, you still need to return something that matches the type. By convention, people use:
```
return NULL;
```
