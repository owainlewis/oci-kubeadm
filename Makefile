all: build

admin-conf:
	@echo "Downloading admin.conf from K8s master"
	@scp opc@k8s-master:/etc/kubernetes/admin.conf .

build:
	@ansible-playbook site.yaml

reset:
	@ansible-playbook site-reset.yaml
