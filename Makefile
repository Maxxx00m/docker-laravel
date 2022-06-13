.PHONY: help

help:
	$(info Helper for laravel docker project)
	$(info Comands:)
	$(info - `build` - build docker images)
	$(info - `run-dev` - start development project)

build:
	docker compose build

run-dev:
	docker compose up