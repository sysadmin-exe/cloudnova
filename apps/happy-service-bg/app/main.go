package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	port := ":8080"

	// Serve static files
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	http.HandleFunc("/", home)

	log.Printf("Starting server on %s...\n", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatalf("Error: %v\n", err)
	}
}

func home(w http.ResponseWriter, r *http.Request) {
	file := "static/index_v2.html"

	if _, err := os.Stat(file); os.IsNotExist(err) {
		http.Error(w, "404 - Page Not Found", http.StatusNotFound)
		return
	}

	http.ServeFile(w, r, file)
}
