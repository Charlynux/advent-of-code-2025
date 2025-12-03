package main

import (
	"bufio"
	"fmt"
	"io"
	"math"
	"os"
	"strconv"
	"strings"
)

// 3
// i < maxLen - 2 (3 - 0)
// i < maxLen - 1 (3 - 1 - 1)

func extract_batteries_generic(s string, targetLen int) int {
	xs := strings.Split(s, "")
	var currentResult = make([]int, targetLen)
	for i := 0; i < targetLen; i++ {
		currentResult[i] = -1
	}
	maxLen := len(xs)
	for i := 0; i < maxLen; i++ {
		currentVal, _ := strconv.Atoi(xs[i])
		for j := 0; j < targetLen; j++ {
			if currentResult[j] < currentVal && i < maxLen-(targetLen-1-j) {
				currentResult[j] = currentVal
				for k := j + 1; k < targetLen; k++ {
					currentResult[k] = -1
				}
				break
			}
		}
	}
	result := 0
	for i := 0; i < targetLen; i++ {
		result += currentResult[i] * int(math.Pow(10, float64(targetLen-i-1)))
	}

	return result
}

func main() {
	file, err := os.Open("input")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	result := 0
	result_part2 := 0
	for {
		line, _, err := reader.ReadLine()

		if err == io.EOF {
			break
		}

		result += extract_batteries_generic(string(line), 2)
		result_part2 += extract_batteries_generic(string(line), 12)
	}
	fmt.Printf("%d \n", result)
	fmt.Printf("%d \n", result_part2)
}
