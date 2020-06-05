user ?= ubuntu
play ?= dev.yaml
inventory ?= inventories/vm.yaml

hello:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ./inventories/localhost.yaml -u=${user} ./hello.yaml

say_hello:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ${inventory} -u=${user} ./hello.yaml

custom:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ${inventory} -u=${user} ${play}

vm:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ${inventory} -u=${user} ./multipassvm.yaml

sly:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ${inventory} -u=${user} ./sly_aws.yaml

micro:
	ansible-playbook --extra-vars "user=${user}" --verbose -i ${inventory} -u=${user} ./prive_micro.yaml
