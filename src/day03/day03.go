package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

func extract_batteries_part1(s string) int {
	xs := strings.Split(s, "")

	var currentDec int = -1
	var currentUnit int = -1
	maxLen := len(xs)
	for j := 0; j < maxLen; j++ {
		currentVal, _ := strconv.Atoi(xs[j])
		if (currentDec < currentVal) && (j < maxLen-1) {
			currentDec = currentVal
			currentUnit = -1
		} else if currentUnit < currentVal {
			currentUnit = currentVal
		}
	}
	return currentDec*10 + currentUnit
}

func main() {
	file, err := os.Open("input")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	result := 0
	for {
		line, _, err := reader.ReadLine()

		if err == io.EOF {
			break
		}

		result += extract_batteries_part1(string(line))
	}
	fmt.Printf("%d \n", result)
}
