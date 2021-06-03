test:
	go test

verbose:
	go test -v

race:
	go test -race -v

build:
	docker build -t chainlink-sdet-project:latest .

run:
	docker run --rm --env WSS=${WSS} --env PARALLEL=${PARALLEL} \
		--name chainlink-sdet-project chainlink-sdet-project:latest
