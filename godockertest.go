package main

import (
	"net/http"
)

func main() {
	output()
	http.HandleFunc("/", serveOutput)
	http.ListenAndServe(":80", nil)
}
