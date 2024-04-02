# Setup Ansible on Amazon Linux Machine 2

## Setup Hostname
```bash
sudo hostnamectl set-hostname ansible-controller 
sudo hostnamectl set-hostname jenkins-controller 
sudo hostnamectl set-hostname maven-builder 
```
## Installation steps:
Step 1 — Install the latest version of a packages 
Step 2 — Use the amazon-linux-extras command to install Ansible.
Step 3– Check Ansible Version
```bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
ansible --version
```
sudo chmod 755 /opt/ansible
sudo chown ec2-user:ec2-user /opt/ansible


<!-- ## Create a user called *ansadmin* (on Control node and Managed host)
```bash
sudo useradd ansadmin
sudo passwd ansadmin
```
## grant sudo access to ansadmin user.
```bash
sudo su -
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
service sshd restart
sudo chown ansadmin:ansadmin /home/ansadmin
sudo chmod 755 /home/ansadmin
sudo su -
``` -->
## To avoid desactivate this warnin message:
[WARNING]: Platform linux on host 172.31.49.26 is using the discovered Python interpreter at /usr/bin/python, 
but future installation of another Python interpreter could change this. See https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html
for more information.
```bash
echo "Interpreter_python=auto_silent" >> /etc/ansible/ansible.cfg
``` 
Interpreter_python=auto_silent


```bash

```

```bash

```

```bash

```

```bash

```

```bash

```

```bash
```



```bash

```

```bash

```
