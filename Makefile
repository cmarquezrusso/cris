# Makefile for Cobra Client Application

# Go parameters
GOCMD := go
GOBUILD := $(GOCMD) build
GOTEST := $(GOCMD) test
GOCLEAN := $(GOCMD) clean
GOGET := $(GOCMD) get

# Binary name
BINARY_NAME := cris

# Main build target
build:
	$(GOBUILD) -o $(BINARY_NAME)

# Cross-compiling for Linux (64-bit)
build-linux:
	GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-linux-amd64

# Cross-compiling for Linux (ARM64)
build-arm64:
	GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_NAME)-linux-arm64

# Cross-compiling for Windows (64-bit)
build-windows:
	GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-windows-amd64.exe

# Cross-compiling for macOS (64-bit)
build-darwin:
	GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME)-darwin-amd64

# Cross-compiling for macOS (M1)
build-darwin-m1:
	GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_NAME)-darwin-arm64

# Run the application
run:
	./$(BINARY_NAME)

# Test the application
test:
	$(GOTEST) ./...

# Clean the generated binaries
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME) $(BINARY_NAME)-linux-amd64 $(BINARY_NAME)-linux-arm64 $(BINARY_NAME)-windows-amd64.exe $(BINARY_NAME)-darwin-amd64 $(BINARY_NAME)-darwin-arm64

# Install dependencies
install:
	$(GOGET) -v ./...

all: build build-linux build-arm64 build-windows build-darwin build-darwin-m1

.PHONY: all build build-linux build-arm64 build-windows build-mac build-mac-m1 run test clean install

