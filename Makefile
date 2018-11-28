ANSIBLE_CMD=ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini

all: create

create:
	terraform init
	terraform apply
	hack/inventory.sh

destroy:
	terraform destroy

ansible:
	$(ANSIBLE_CMD) ansible/site.yaml

# The following tasks are used to install components into your K8s cluster

ccm:
	$(ANSIBLE_CMD) ansible/ccm.yaml

provisioner:
	$(ANSIBLE_CMD) ansible/provisioner.yaml

dashboard:
	$(ANSIBLE_CMD) ansible/dashboard.yaml
