# MapReduce in Go – Word Count Demo

This code example demonstrates a simple MapReduce style word count in Go, using Brian Kernighan's UNIX quote from the demo we watched in A2:

"UNIX is basically a simple operating system, but you have to be a genius to understand the simplicity."

The code explicitly separates the core MapReduce phases: **Map → Shuffle → Reduce**, making it suitable for educational purposes in distributed systems or data processing courses.

## File: `main.go`

### Map Phase
The `mapFunction` takes a string of text and emits a slice of key/value pairs:

```go
[]KeyValue{
    {"unix", 1},
    {"is", 1},
    {"basically", 1},
    ...
}
