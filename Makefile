all: build

# build binaries for current platform
build: build/tenderseed

build/tenderseed: cmd/tenderseed/main.go $(wildcard internal/**/*.go) go.mod
	CGO_ENABLED=0 go build -o ./build/tenderseed ./cmd/tenderseed

# build linux binaries
build-linux: 
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./build/tenderseed ./cmd/tenderseed

build/tenderseed.elf: cmd/tenderseed/main.go $(wildcard internal/**/*.go) go.mod
	CGO_ENABLED=0 GOOS=linux go build -o ./build/tenderseed.elf ./cmd/tenderseed

test:
	go test ./...

lint:
	golint --set_exit_status ./...

clean:
	rm -rf build

.PHONY: all clean test lint build-linux build


ci-sign: 
	drone sign public-awesome/tenderseed --save
