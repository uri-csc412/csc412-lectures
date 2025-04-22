package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

// our struct for the intermediate key-value pair step in MAP
type KeyValue struct {
	Key   string
	Value int
}

// MAP: emit key/value pairs for each word
func mapFunction(text string) []KeyValue {
	words := strings.FieldsFunc(text, func(r rune) bool {
		return !('A' <= r && r <= 'Z' || 'a' <= r && r <= 'z')
	})

	var kvs []KeyValue
	for _, word := range words {
		word = strings.ToLower(word)
		kvs = append(kvs, KeyValue{Key: word, Value: 1})
	}
	return kvs
}

// SHUFFLE: group values by key
func shuffle(kvs []KeyValue) map[string][]int {
	grouped := make(map[string][]int)
	for _, kv := range kvs {
		grouped[kv.Key] = append(grouped[kv.Key], kv.Value)
	}
	return grouped
}

// REDUCE: aggregate counts
func reduce(grouped map[string][]int) map[string]int {
	final := make(map[string]int)
	for key, values := range grouped {
		sum := 0
		for _, v := range values {
			sum += v
		}
		final[key] = sum
	}
	return final
}

func loadAllFileContentFromDir(dirPath string) (string, error) {
	var builder strings.Builder

	entries, err := os.ReadDir(dirPath)
	if err != nil {
		return "", fmt.Errorf("failed to read directory: %w", err)
	}

	for _, entry := range entries {
		if !entry.Type().IsRegular() {
			continue
		}

		fullPath := filepath.Join(dirPath, entry.Name())
		content, err := ioutil.ReadFile(fullPath)
		if err != nil {
			return "", fmt.Errorf("failed to read file %s: %w", entry.Name(), err)
		}

		builder.WriteString(fmt.Sprintf("=== %s ===\n%s\n\n", entry.Name(), content))
	}

	return builder.String(), nil
}

func main() {
	// UNIX demo text from Brian Kernighan!
	text, err := loadAllFileContentFromDir("../data")
	if err != nil {
		panic("game over man! the directory was not found")
	}
	// UNIX demo text from Brian Kernighan!
	//text := `UNIX is basically a simple operating system, but you have to be a genius to understand the simplicity.`

	// step 1: MAP (assign to key/value)
	fmt.Println("→ MAP PHASE")
	kvs := mapFunction(text)
	for _, kv := range kvs {
		fmt.Printf("(%q, %d)\n", kv.Key, kv.Value)
	}

	// step 2: SHUFFLE
	fmt.Println("\n→ SHUFFLE PHASE")
	grouped := shuffle(kvs)
	keys := make([]string, 0, len(grouped))
	for k := range grouped {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	for _, k := range keys {
		fmt.Printf("%q: %v\n", k, grouped[k])
	}

	// step 3: REDUCE
	fmt.Println("\n→ REDUCE PHASE")
	result := reduce(grouped)
	for _, k := range keys {
		fmt.Printf("%-12s %d\n", k, result[k])
	}
}
