all: build

.PHONY: infra
infra:
	terraform init
	terraform apply

.PHONY: build
build:
	@ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/site.yaml

.PHONY: destroy
destroy:
	terraform destroy
