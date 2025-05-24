SHELL := bash

define HELP
Available targets:
  build        - Build in debug mode
  release      - Build in release mode
  install      - Install example binary to /usr/local/bin (requires sudo)
  install-user - Install example binary to ~/.local/bin
  clean        - Clean build artifacts
  test         - Run tests
  fmt          - Format code
  check        - Check code without building
  lint/clippy  - Run clippy linter
  help         - Show this help message
endef
export HELP

EXAMPLE_NAME := parse_policy
RELEASE_FILE := target/release/examples/$(EXAMPLE_NAME)

default: build

build:
	cargo build

release:
	cargo build --release
	cargo build --release --example $(EXAMPLE_NAME)

install: release
	install -m 755 $(RELEASE_FILE) /usr/local/bin/$(EXAMPLE_NAME)

install-user: release
	mkdir -p ~/.local/bin
	install -m 755 $(RELEASE_FILE) ~/.local/bin/$(EXAMPLE_NAME)

clean test fmt check:
	cargo $@

lint clippy:
	cargo clippy

help:
	@echo "$$HELP"