// +build darwin dragonfly freebsd linux nacl netbsd openbsd solaris

package main

import (
	"fmt"
	"io"
	"net/http"
)

func output() {
	fmt.Println("Hello, Linux!")
}

func serveOutput(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello, Linux!")
}
