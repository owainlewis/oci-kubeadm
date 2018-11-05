all: build

.PHONY: infra
infra:
	terraform init
	terraform apply

.PHONY: build
build:
	@ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/site.yaml

ccm:
	@ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/ccm.yaml

storage:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/storage.yaml

.PHONY: destroy
destroy:
	terraform destroy

rebuild: destroy infra
