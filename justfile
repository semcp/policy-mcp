all: build

build:
	cargo build

release:
	cargo build --release

clean:
	cargo clean

test:
	cargo test

fmt:
	cargo fmt

check:
	cargo check

lint:
	cargo clippy

help:
	@echo "Available targets:"
	@echo "  build        - Build in debug mode"
	@echo "  release      - Build in release mode"
	@echo "  install      - Install to /usr/local/bin (requires sudo)"
	@echo "  install-user - Install to ~/.local/bin"
	@echo "  clean        - Clean build artifacts"
	@echo "  test         - Run tests"
	@echo "  fmt          - Format code"
	@echo "  check        - Check code without building"
	@echo "  lint         - Run clippy linter"
	@echo "  help         - Show this help message" 