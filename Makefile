user ?= ubuntu
play ?= dev.yaml
inventory ?= inventories/vm.yaml

hello:
	ansible-playbook --verbose -i ${inventory} -u=${user} ./hello.yaml

custom:
	ansible-playbook --verbose -i ${inventory} -u=${user} ${play}

vm:
	ansible-playbook --verbose -i ${inventory} -u=${user} ./multipass-vm.yaml

sly:
	ansible-playbook --verbose -i ${inventory} -u=${user} ./sly_aws.yaml

micro:
	ansible-playbook --verbose -i ${inventory} -u=${user} ./prive_micro.yaml
