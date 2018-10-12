all: build

build:
	@ansible-playbook -vi hosts.ini site.yaml
