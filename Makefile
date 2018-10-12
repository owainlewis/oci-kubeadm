all: build

build:
	@ansible-playbook -v site.yaml
