# Chainlink SDET Project

## Requirements
To run the tests, you must have [go](https://golang.org/) or [Docker](https://www.docker.com/) installed.
You also need a valid WebSocket address to make requests to the blockchain. You can leverage services like [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/).

## Configuration
As of 06/2020, the WebSocket address and the test parallelization are configurable.
You must either create a file named `config.yml` under the `config` directory or pass-in the environment variables.

Config file example:
```yaml
wss: "myWebSocketAddr"
parallel: true
```
Environment variables example:
```bash
PARALLEL=false WSS=myAddr go test
```
**The environment variables take precedence over the config file.**
**Without a WebSocket address, the tests will fail.**

## Instructions
To run the tests, you can use the provided `Makefile` recipes, use your own `go` executable or build and run the Docker container.

### Local
Examples:
```bash
make go-test                          # Runs "go test -v"
make compile                          # Compiles the test binary
make binary                           # Runs the compiled binary (equivalent to "make go-test")
WSS=myAddr PARALLEL=false make binary # Same as "make binary" but with env vars
```

### Docker
The process of building the image is a bit slow because Docker downloads the dependencies and compiles the test binary. After that, each execution is faster because the container runs the compiled binary.

Examples:
```bash
make build             # Builds the Docker image
make run               # Runs the container with the compiled test binary
PARALLEL=true make run # Same as "make run" but with env vars
```

The requirement of the WebSocket is valid for the container as well.

## Considerations

CONSIDERATIONS:

