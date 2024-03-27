#  Creating Ansinble Inventory File

1. Login into Ansible controller OS
2. Create Inventory file under /opt/ directory
Working as a root user
```bash
sudo su -
vim /opt/hosts
```
```yml
[ansible_controller]
172.31.61.78
[ansible_controller:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/terraform_dwp.pem

[jenkins_controller]
172.31.63.189
[jenkins_controller:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/terraform_dwp.pem

[jenkins_worker_node_maven]
172.31.61.249
[jenkins_worker_node_maven:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/opt/terraform_dwp.pem
```

## Using MobaXterm CLI Drag and drop thye private PEM key on /opt/ directory on my Ansible Controller
```bash

```
```bash

```
```bash

```

<!-- ```bash
sudo chown ubuntu:ubuntu /opt/
touch /opt/a01_inventory
touch /opt/private-ssh-key.pem
sudo chmod 400 private-ssh-key.pem
``` -->
1. xxx
chown 400 private-ssh-key.pem
ansible all -i inventory -m ping
