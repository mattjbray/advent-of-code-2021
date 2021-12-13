.PHONY: build
build:
	dune build

.PHONY: test
test:
	dune runtest

.PHONY: run
run:
	dune exec -- bin/main.exe

.PHONY: format
format:
	dune build @fmt --auto-promote || true
