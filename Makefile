ANSIBLE_CMD=ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi ansible/hosts.ini

all: build

.PHONY: create
create:
	terraform init
	terraform apply
	hack/inventory.sh
	$ANSIBLE_CMD ansible/site.yaml

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: rebuild
rebuild: destroy create

.PHONY: ansible
ansible:
	$(ANSIBLE_CMD) ansible/site.yaml

.PHONY: ccm
ccm:
	$(ANSIBLE_CMD) ansible/ccm.yaml

.PHONY: provisioner
provisioner:
	$(ANSIBLE_CMD) ansible/provisioner.yaml

.PHONY: dashboard
dashboard:
	$(ANSIBLE_CMD) ansible/dashboard.yaml
