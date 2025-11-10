package main

import (
	"fmt"
	"io"
	"os"
	"syscall"
)

func handleClose(f os.File) {
	err := f.Close()
	if err != nil {
		fmt.Println(err)
	}
}

// Contents returns the file's contents as a string.
func Contents(filename string) (string, error) {
	f, err := os.Open(filename)
	if err != nil {
		return "", err
	}
	//defer handleClose(*f) // f.Close will run when we're finished.
	defer f.Close()

	var result []byte
	buf := make([]byte, 100)
	for {
		n, err := f.Read(buf[0:])
		result = append(result, buf[0:n]...) // append is discussed later.
		if err != nil {
			if err == io.EOF {
				break
			}
			return "", err // f will be closed if we return here.
		}
	}
	return string(result), nil // f will be closed if we return here.
}

// PathError records an error and the operation and
// file path that caused it.
type PathError struct {
	Op   string // "open", "unlink", etc.
	Path string // The associated file.
	Err  error  // Returned by the system call.
}

func (e *PathError) Error() string {
	return e.Op + " " + e.Path + ": " + e.Err.Error()
}

func main() {
	var filename string = "stevefuntime.txt"
	for try := 0; try < 2; try++ {
		_, err := os.Create(filename)
		if err == nil {
			fmt.Println(err)
			return
		}

		if e, ok := err.(*os.PathError); ok && e.Err == syscall.ENOSPC {
			//deleteTempFiles() // Recover some space.
			continue
		}
		return
	}
}
