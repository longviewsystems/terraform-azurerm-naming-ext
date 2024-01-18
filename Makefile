.ONESHELL:

SHELL := /bin/bash

all:	env-vars tf
env-vars:
	echo "Calling env-vars"
	chmod +x ./scripts/bootstrapenv.sh
tf:
	echo "Calling tf"
	source ./scripts/bootstrapenv.sh
	terraform init
	terraform plan
	terraform apply -auto-approve
destroy:
	source ./scripts/bootstrapenv.sh
	terraform destroy -auto-approve
clean:
	@find . -name terraform.tfstate -type f -exec rm -rf {} +
	@find . -name terraform.tfstate.backup -type f -exec rm -rf {} +
	@find . -name .terraform -type d -exec rm -rf {} +
	@find . -name .terraform.lock.hcl -type f -exec rm -rf {} +
	@find . -name providers -type d -exec rm -rf {} +