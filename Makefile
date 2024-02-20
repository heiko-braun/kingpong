# Define Go command and flags
GOFLAGS = -ldflags="-s -w"

# Define the target executable
TARGET = pingpong

# Default target: build the executable
all: build

# Rule to build the target executable
build: 
	go build $(GOFLAGS) -o $(TARGET) *.go

# Clean target: remove the target executable
clean:
	rm -f $(TARGET)

# Run target: build and run the target executable
run: $(TARGET)
	./$(TARGET)

# Test target: run Go tests for the project
test:
	$(GO) test ./...

images-arm:	
	podman build -t ikebraun/pong -f docker_pong .
	podman build -t ikebraun/ping -f docker_ping .

images:	
	podman build --arch=386 -t ikebraun/pong -f docker_pong .
	podman build --arch=386 -t ikebraun/ping -f docker_ping .

tag-images:
	podman tag localhost/ikebraun/ping:latest ghcr.io/heiko-braun/ping:latest
	podman tag localhost/ikebraun/pong:latest ghcr.io/heiko-braun/pong:latest

publish-images:
	podman push ghcr.io/heiko-braun/ping:latest
	podman push ghcr.io/heiko-braun/pong:latest
