.ONESHELL:

SHELL := /bin/bash

terratest:
	echo "Calling terratest"	
	go test -v -timeout 45m
clean:
	@find ../ -name terraform.tfstate -type f -exec rm -rf {} +
	@find ../ -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find ../ -name .terraform -type d -exec rm -rf {} +
	@find ../ -name .terraform.lock.hcl -type f -exec rm -rf {} +