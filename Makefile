ANSIBLE_CMD=ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini

all: create

create:
	terraform init
	terraform apply
	hack/inventory.sh

destroy:
	terraform destroy

rebuild: destroy create

ansible:
	$(ANSIBLE_CMD) ansible/site.yaml

ccm:
	$(ANSIBLE_CMD) ansible/ccm.yaml

provisioner:
	$(ANSIBLE_CMD) ansible/provisioner.yaml

dashboard:
	$(ANSIBLE_CMD) ansible/dashboard.yaml
