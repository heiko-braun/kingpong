package main

import (
	"bytes"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
)

type Pong struct{}

func pongHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	i, err := strconv.Atoi(params["length"])
	if err != nil {
		panic(err)
	}
	i -= 4
	result := bytes.NewBufferString("po")
	for j := 0; j < i; j++ {
		result.WriteString("o")
	}
	result.WriteString("ng")
	w.Write(result.Bytes())
}

// Start starts the pong service on the given port.
func (p Pong) Start(port int) {

	r := mux.NewRouter()
	r.HandleFunc("/pong/{length:[0-9]+}", pongHandler)

	sport := fmt.Sprintf("0.0.0.0:%v", port)
	fmt.Printf("Pong service is up and listening on port %v", port)

	srv := &http.Server{
		Handler:      r,
		Addr:         sport,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Fatal(srv.ListenAndServe())
}
