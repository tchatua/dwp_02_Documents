# Ansible

```sh
sudo hostnamectl set-hostname ansible-controller
```
## Inventory file
```yml
[ansible]
192.168.10.39
[ansible:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=/opt/ansible/terraform_dwp.pem

[jenkins]
192.168.20.24
[jenkins:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=/opt/ansible/terraform_dwp.pem

[maven]
192.168.20.98
[maven:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=/opt/ansible/terraform_dwp.pem 
```

```sh
ansible all -m ping -i a01_hosts
```

### Ansible playbook to setup Jenkins 
```yml
# vim 01_Jenkins_Setup.yml
---
- hosts: jenkins
  become: true
  vars:
    # java_packages:
    #   - 
    jenkins_packages:
      - jenkins  
  tasks:
    - name: 1 Update local package index
      yum:
        name: '*'
        state: latest 
    - name: 2 Download Jenkins repository file
      get_url:
        url: https://pkg.jenkins.io/redhat-stable/jenkins.repo
        dest: /etc/yum.repos.d/jenkins.repo
    - name: 3 Import Jenkins-CI key
      shell: rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 
      warn: false
    - name: 4 Upgrade all packages
      yum:
        name: '*'
        state: latest 
    - name: 5 Install Java
      yum:
        name: amazon-linux-extras install java-openjdk11
        state: present
    - name: 6 Install Jenkins
      yum:
        name: "{{ jenkins_packages }}"
        state: present
    - name: 7 Start Jenkins service
      service:
        name: jenkins
        state: started
    - name: 8 Enable service jenkins
      service:
        name: jenkins
        enabled: yes
    - name: 9/9 Install git
      yum:
        name: git
        state: present
```

### Ansible playbook to setup Maven
```yml
---
- hosts: jenkins
  become: true
  # vars:
  #   # jenkins_packages:
  #   #   - jenkins  
  tasks:
    - name: 1 Update local package index
      yum:
        name: '*'
        state: latest 
    - name: 2 Download Jenkins repository file
      get_url:
        url: https://pkg.jenkins.io/redhat-stable/jenkins.repo
        dest: /etc/yum.repos.d/jenkins.repo
    - name: 3 Import Jenkins-CI key
      shell: rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 
      # warn: false
    - name: 4 Upgrade all packages
      yum:
        name: '*'
        state: latest 
    - name: 5 Install Java
      command: amazon-linux-extras install java-openjdk11 -y
      # yum:
      #   name: amazon-linux-extras install java-openjdk11
      #   state: present
    - name: 6 Install Jenkins
      command: yum install -y jenkins
      # warn: false
      # yum:
      #   name: "{{ jenkins_packages }}"
      #   state: present
    - name: 7 Start Jenkins service
      service:
        name: jenkins
        state: started
    - name: 8 Enable service jenkins
      service:
        name: jenkins
        enabled: yes
    - name: 9/9 Install git
      yum:
        name: git
        state: present
```

```sh

```

```sh

```

```sh

```

# Jenkins controller Node

```sh

```

```sh

```

```sh

```

```sh

```
# Maven: Jenkins worker node

```sh
sudo hostnamectl set-hostname maven-builder

```

```sh

```

```sh

```

```sh

```

```sh

```



