local:
	ansible-playbook --verbose -i inventory.yaml -u=ubuntu ./dev.yaml

sly:
	ansible-playbook --verbose -i inventory.yaml -u=ubuntu ./sly_aws.yaml

micro:
	ansible-playbook --verbose -i inventory.yaml -u=ubuntu ./prive_micro.yaml
