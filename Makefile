.PHONY: help

help:
	$(info Helper for laravel docker project)
	$(info Comands:)
	$(info - `build` - build docker images)
	$(info - `run-dev` - start development project)
	$(info - `terraform-apply` - start project using terraform)
	$(info - `terraform-destroy` - stop project using terraform)

build:
	./build.sh

run-dev:
	docker compose up

terraform-apply:
	terraform apply

terraform-destroy:
	terraform destroy