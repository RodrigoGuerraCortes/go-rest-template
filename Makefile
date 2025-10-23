APP_NAME = go-rest-template
CMD_DIR = cmd/api
BINARY = bin/$(APP_NAME)

run:
	go run $(CMD_DIR)/main.go

build:
	go build -o $(BINARY) $(CMD_DIR)/main.go

test:
	go test ./... -cover

clean:
	rm -rf bin

docker-build:
	docker build -t $(APP_NAME):latest .

docker-run:
	docker run -p 8080:8080 $(APP_NAME):latest
