# Jenkins installation

sudo hostnamectl set-hostname Jenkins-Maven 

1. Jenkins Installation
2. Add the Jenkins repo key to system
3. Add repository system
4. Install dependencies
5. Install Jenkins

## Ansible playbook: Jenkins installation

```yml
---
- hosts: jenkins-controller
  become: true
  tasks:
    # - name: Set hostname:
    #   hostname:
    #     name: jenkins_controller
    - name: add the key to your system
      apt_key:
        url: https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
        state: present 
    - name: add Jenkins apt repository entry
      apt_repository:
        repo: 'deb https://pkg.jenkins.io/debian-stable binary/'
        state: present
    - name: Install Java
      apt: 
        name: openjdk-11-jre
        state: present
    - name: Install Jenkins
      apt: 
        name: jenkins
        state: present
    - name: Start service jenkins
      service:
        name: jenkins
        state: started
    - name: Enable service jenkins
      service:
        name: jenkins
        enabled: yes
```

## Go to my Jenkins CLI:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword