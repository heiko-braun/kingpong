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

images:	
	podman build -t ikebraun/pong -f docker_pong .
	podman build -t ikebraun/ping -f docker_ping .