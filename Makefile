all: build

infra:
	terraform init
	terraform apply

build:
	@ansible-playbook -vi hosts.ini site.yaml
