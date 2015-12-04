package main

import (
	"fmt"
	"io"
	"net/http"
)

func output() {
	fmt.Println("Hello, Windows!")
}

func serveOutput(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello, Windows!")
}
