# PriveBackend Ansible
This project provides ansible setup scripts which can be used to provision a
VM or host system ready for development. The help you go halfway to reduce setup time,
allowing you to concentrate more on setting up eclipse and associated artifacts.

## Setup
You must first install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html), which
be installed either through it's PPA or through [Python Pip](https://pypi.org/project/pip/) as below:

```bash
sudo apt install -y python-pip

pip install ansible
```

## Need To Know

Executing the ansible script requires using inventories that point ansible to target servers, vms or hosts, these 
are in [inventories](./inventories). Before using the [VM Inventory](./inventories/vm.yaml), ensure to update the IPs
appropriately for the target hosts you wish to use, more so, these hosts should have your ssh pub key within their
[authorized_keys](https://www.ssh.com/ssh/authorized_keys/) as we will be using ssh keys instead as they are more secure.
  

## Local setup
To set up your local system instead of a vm for working on the [SlyAWS](https://github.com/JSchillinger/SlyAWS) project, simply run the following in the root directory:

Elevate your user to be able to use `sudo` without password:

```bash
sudo su $USER
```

Then run:

```bash
make sly inventory=localhost user=darkvoid
```

## VM setup
We will be using [Multipass](https://multipass.run/) to setup VMs for use in development, as it makes it 
really easy to lunch them quickly. You can set up both multipass and the 3 VMs using below make command:

Elevate your user to be able to use `sudo` without password:

```bash
sudo su $USER
```

Then run:

```bash
make vm inventory=inventory/localhost.yaml user=$USER
```

Once successfully done, we can see all vms launched with:

```bash
multipass ls
```

Which should show a response following below format (your IP details will be different)

```bash
Name                    State             IPv4             Image
master                  Running           10.235.108.229   Ubuntu 18.04 LTS
slave1                  Running           10.235.108.91    Ubuntu 18.04 LTS
slave2                  Running           10.235.108.92    Ubuntu 18.04 LTS
```

More so, ansible would have generated a new inventory file called `multipass_vm_inventory.yaml`
which you can use to supply

You would need enter each host and copy your ssh public key from the host into each vms [authorized_keys](https://www.ssh.com/ssh/authorized_keys/)
file, which would both allow you ssh into them and also allow ansible connect into them.

You can ssh into the master like so:

```bash
multipass shell master
```

Once the keys have being copied properly, then you can execute either the SlyAWS or PriveMicro 
ansible playbooks to setup all the VMs appropriately, like below:

- For SlyAWS

```bash
make sly inventory=./multipass_vm_inventory.yaml user=ubuntu
```

