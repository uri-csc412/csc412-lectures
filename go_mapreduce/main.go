package main

import (
	"fmt"
	"strings"
)

// our struct for the intermediate key-value pair step in MAP
type KeyValue struct {
	Key   string
	Value string
}

// mapFunc turns input text into []KeyValue
func mapFunc(input string) []KeyValue {
	words := strings.Fields(strings.ToLower(input))
	var result []KeyValue

	for _, word := range words {
		result = append(result, KeyValue{
			Key:   word,
			Value: "1",
		})
	}

	return result
}

// reduceFunc takes a key and all its values, then combines them
func reduceFunc(key string, values []string) string {
	count := 0
	for range values {
		count++
	}
	return fmt.Sprintf("%d", count)
}

func main() {
	input := "go is fun and is garbage collected collected collected"

	// MAP STEP
	mapped := mapFunc(input)

	fmt.Println("hi mom")
	fmt.Println("Mapped key-value pairs:")
	for _, kv := range mapped {
		fmt.Printf("{Key: %q, Value: %q}\n", kv.Key, kv.Value)
	}

	// SHUFFLE/GROUP STEP
	grouped := make(map[string][]string)
	for _, kv := range mapped {
		grouped[kv.Key] = append(grouped[kv.Key], kv.Value)
	}

	// REDUCE STEP
	fmt.Println("\nReduced results:")
	for key, values := range grouped {
		output := reduceFunc(key, values)
		fmt.Printf("%s: %s\n", key, output)
	}
}
