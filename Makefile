all: build

.PHONY: create
create:
	terraform init
	terraform apply
	hack/inventory.sh
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/site.yaml

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: rebuild
rebuild: destroy create

.PHONY: ansible
ansible:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/site.yaml

.PHONY: ccm
ccm:
	@ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/ccm.yaml

.PHONY: storage
storage:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini ansible/storage.yaml
