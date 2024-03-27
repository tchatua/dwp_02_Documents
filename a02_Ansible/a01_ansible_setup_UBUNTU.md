# Setup Ansible;

# Setup Hostname
```bash
sudo hostnamectl set-hostname ansible_controller 
```

# #########################################
## 1 - Install Ansible on Ubuntu
# #########################################
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
ansible --version
```
ansible [core 2.16.4]
config file = /etc/ansible/ansible.cfg
configured module search path = ['/home/ubuntu/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
ansible python module location = /usr/lib/python3/dist-packages/ansible
ansible collection location = /home/ubuntu/.ansible/collections:/usr/share/ansible/collections
executable location = /usr/bin/ansible
python version = 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] (/usr/bin/python3)
jinja version = 3.0.3
libyaml = True

## 2 - Prepare my Inventory file by adding Private IP of my jenkins controller and worker nodes
```bash
vim /opt/hosts
```

## Using MobaXterm to copy the PEM key in my Ansible Controller System

# To provide the password to the ssh command in a non-interactive way
# To install sshpass on Ubuntu
# sshpass -p 'your_password' ssh user@hostname
sudo apt update
sudo apt install sshpass
sshpass -V
