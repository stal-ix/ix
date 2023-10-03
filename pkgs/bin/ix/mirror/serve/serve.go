package main

import "net/http"

func main() {
    port := ":__port__"
    handler := http.FileServer(http.Dir("__from__"))
    http.ListenAndServe(port, handler)
}
