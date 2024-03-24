# Setup Ansible;

## 1 - Install Ansible on Ubuntu
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```
Test verification
```bash
ansible --version
```

## 2 - Prepare my Inventory file by adding Private IP of my jenkins controller and worker nodes
```bash
vim /opt/inventory
```

```bash
[jenkins-controller]
192.168.10.11
[jenkins-controller:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=/opt/private-ssh-key.pem
[jenkins-worker-node]
192.168.20.21
[jenkins-worker-node:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=/opt/private-ssh-key.pem
```

```bash
chown 400 private-ssh-key.pem
ansible all -i inventory -m ping
```