# Ansible

## Setup hostname of my ansible system OS
```sh
sudo hostnamectl set-hostname ansible-controller
```

## Copy ansible.cfg URL and copy and paste the content in the /etc/ansible/ansible.cfg.
```sh
https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg
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


# Jenkins controller Node

```sh

```

# Maven: Jenkins worker node

```sh
sudo hostnamectl set-hostname maven-builder

```

## Configure AWS credentials securely using ansible vault
- Create a file named: aws_credentials.yml
```sh
ansible-vault create aws_credentials.yml
```
input sensitive information, 
Ansible vault will encrypt the file and prompt me to enter and confirm the password

- Useful ansible vault cli:
```sh
# Edit an existing encrypted file:
ansible-vault edit filename.yml
# Encrypt an existing file:
ansible-vault encrypt filename.yml
# Decrypt an encrypted file:
ansible-vault decrypt filename.yml
# View the contents of an encrypted file:
ansible-vault view filename.yml
# Rekey an encrypted file: display the contents of the encrypted file without decrypting it
ansible-vault rekey filename.yml
```

```yml
aws_access_key: YOUR_ACCESS_KEY
aws_secret_key: YOUR_SECRET_KEY
region: YOUR_REGION
```

- Create an ansible playbook that use the vault-encrypted file to configure AWS credentials
```yml
    - name: Configure AWS CLI
      command: aws configure set {{ item.key }} {{ item.value }}
      with_items:
        - { key: "aws_access_key_id", value: "{{ aws_access_key_id }}" }
        - { key: "aws_secret_access_key", value: "{{ aws_secret_access_key }}" }
        - { key: "region", value: "{{ region }}" }
```

- Run the ansible playbook by giving to the prompt the password for the encrypted file
```sh
ansible-playbook your_playbook.yml --ask-vault-pass
```

ansible-playbook e01_bootstrap_setup.yml -i a01_hosts --ask-vault-pass --check

### Download Kubernetes credentials and cluster configuration (.kube/config file) from the cluster  

```sh 
aws eks update-kubeconfig --region us-east-1 --name dwp-eks-01
```

## Kubernetes Cluster

### Kubernetes Manifest Files

#### namespace.yml
- *Namespace* is the segregate logical group in the Kubernetes
```yml
--- 
apiVersion: v1 
kind: Namespace   # what kind of resource I'm creating
metadata: 
  name: dev   # Name of my namespace
```

```sh
# Default namespace in the K8s cluster
kubectl get ns
# NAME              STATUS   AGE
# default           Active   3h26m
# kube-node-lease   Active   3h26m
# kube-public       Active   3h26m
# kube-system       Active   3h26m

kubectl apply -f a01_namespace.yml 
# namespace/dev created

kubectl get ns
# NAME              STATUS   AGE
# default           Active   3h31m
# dev              Active   5s
# kube-node-lease   Active   3h31m
# kube-public       Active   3h31m
# kube-system       Active   3h31m
```

#### deployment.yml

```yml
--- 
apiVersion: apps/v1 
kind: Deployment            # what kind of resource I'm creating
metadata: 
  name: goumgue_rtp         # Name of my deployment
  namespace: dev        # Name of my namespace
spec: 
  replicas: 1 
  selector:             # will tell me which service is associate with this deployment
    matchLabels:        # tell me which service it should connect --> should match with selector on service manifest file
      app: goumgue_rtp
    template:           # Tell me which container template should be use to create our Pods
      metadata:
        labels: 
          app: goumgue_rtp 
      spec: 
        ImagePullSecrets: 
        - name: jfrog_credential    # name of the credential that I'm using to pull the secret image 
        containers:                 # Container that I'm using inside the Pod
        - name: goumgue_rtp 
          image: xxxxxxxxxxxxxxxxxxxxxxxxxx # image of my container
          ImagePullPolicy: Always 
          ports:
          - container: 8080 # Port number where the app is running
          env: # environment variable which has been prove by our developers. I kept iot as a statice information
          - name: CONSUMER_KEY 
            value: xxxxxxxxxxxxxx 
          - name: CONSUMER_SECRET 
            value: xxxxxxxxxxxxxxxxxxxxxxxx 
          - name: ACCESS_TOKEN 
            value: xxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
          - name: ACCESS_TOKEN_SECRET 
            value: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

```sh
# To create a deployment
kubectl apply -f a02_Deployment.yml 
# deployment.apps/goumgue-dwp created
# -----------------------------------------------
# To see the deployment information in my namespace dev
kubectl get all -n dev
# NAME                               READY   STATUS             RESTARTS   AGE
# pod/goumgue-dwp-5bdc657855-25cfk   0/1     ImagePullBackOff   0          2m17s
# pod/goumgue-dwp-5bdc657855-55tw6   0/1     ImagePullBackOff   0          2m17s

# NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/goumgue-dwp   0/2     2            0           2m17s

# NAME                                     DESIRED   CURRENT   READY   AGE
# replicaset.apps/goumgue-dwp-5bdc657855   2         2         0       2m17s

kubectl get deploy -n dev
# NAME          READY   UP-TO-DATE   AVAILABLE   AGE
# goumgue-dwp   0/2     2            0           3m23s

```
#### Let's find what is the issue with this fail deployment by checking log file
```json
# kubectl describe pod/goumgue-dwp-5bdc657855-55tw6 -n dev
Name:             goumgue-dwp-5bdc657855-55tw6
Namespace:        dev
Priority:         0
Service Account:  default
Node:             ip-192-168-20-214.ec2.internal/192.168.20.214
Start Time:       Thu, 04 Apr 2024 02:21:04 +0000
Labels:           app=goumgue-dwp
                  pod-template-hash=5bdc657855
Annotations:      <none>
Status:           Pending
IP:               192.168.20.118
IPs:
  IP:           192.168.20.118
Controlled By:  ReplicaSet/goumgue-dwp-5bdc657855
Containers:
  goumgue-dwp:
    Container ID:   
    Image:          goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2
    Image ID:       
    Port:           8000/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:
      CONSUMER_KEY:         G6lmKhsi0V9TvXt6oKTfjRBCr
      CONSUMER_SECRET:      bEyDk8X0p8SQd4376eoNV4nH8To22sHcJOoFt0ZqOKS37hhI4q
      ACCESS_TOKEN:         9703354-52rXHD6EeOQeYyhtNz1w8UVOgbcLcgOo4O7MB6WV3
      ACCESS_TOKEN_SECRET:  zBThlZDEp8qnu7NwwdHNth8eg3Rf9zqbvUEFUTaZtN2SF
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-znrjt (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-znrjt:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                    From               Message
  ----     ------     ----                   ----               -------
  Normal   Scheduled  6m45s                  default-scheduler  Successfully assigned dev/goumgue-dwp-5bdc657855-55tw6 to ip-192-168-20-214.ec2.internal
  Normal   Pulling    5m16s (x4 over 6m44s)  kubelet            Pulling image "goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2"
  Warning  Failed     5m16s (x4 over 6m44s)  kubelet            Failed to pull image "goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2": failed to pull and unpack image "goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2": failed to resolve reference "goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2": failed to authorize: failed to fetch anonymous token: unexpected status from GET request to https://goumgue81.jfrog.io/artifactory/api/docker/goumgue-docker-local/v2/token?scope=repository%3Aappagt%3Apull&scope=repository%3Agoumgue-docker-local%2Fappagt%3Apull&service=goumgue81.jfrog.io: 401
  Warning  Failed     5m16s (x4 over 6m44s)  kubelet            Error: ErrImagePull
  Warning  Failed     5m2s (x6 over 6m43s)   kubelet            Error: ImagePullBackOff
  Normal   BackOff    90s (x21 over 6m43s)   kubelet            Back-off pulling image "goumgue81.jfrog.io/goumgue-docker-local/appagt:2.1.2"
```
- To overcome this proble, I need to use secrets.

#### Create and use the secret:

##### Create a dedicated user to use a docker login
Go to https://goumgue81.jfrog.io/ GUI  Platform configuration  User management  New user
User settings:
*Username: jfrog_docker_cred 
*Email address: tchatua@gmail.com
Roles: SELECT :: Administer Platform
Password:: Enter password and save

##### Login into Jfrog using username and password to being able to pull an image from Jfrog

```sh
docker login https://goumgue81.jfrog.io
# Username: jfrog_docker_cred
# Password: 
# WARNING! Your password will be stored unencrypted in /home/ec2-user/.docker/config.json.
# Configure a credential helper to remove this warning. See
# https://docs.docker.com/engine/reference/commandline/login/#credentials-store

# Login Succeeded
```
##### Generate encode value for ~/.docker/config.json file
```sh
cat ~/.docker/config.json | base64 -w0
# ewoJImF1dGhzIjogewoJCSJnb3VtZ3VlODEuamZybcuaW8iOiB7CgkJCSJhdXRoIjogIFtWnliMmRmWkc5amEyVnlYMk55WldRNlYyRnRZV3R2ZF4QVh5MDVNelV6IgoJCX0KCX0KfQ=
```

##### Update the output information into my secret manifest file

```yml
--- 
apiVersion: v1
kind: Secret
metadata:
  name: jfrogdockercredential
  namespace: dev
data:
  .dockerconfigjson: ewoJImF1dGhzIjogewoJCnb3VtZ3VlODEuamZyb2cuaW8iOiB7RrYjJOclpYSmpjbVZrWlc1MGFXRnNPbGRoYldGcmIzVnNRRjh0T1RNMU13PT0iCgkJfQoJfQp9
type: kubernetes.io/dockerconfigjson
```

```sh
kubectl apply -f a03_secret.yml 
# secret/jfrogdockercredential created

kubectl apply -f a02_Deployment.yml
# deployment.apps/goumgue-dwp created

[ec2-user@maven-builder kubernetes]$ kubectl get all -n dev
# NAME                               READY   STATUS    RESTARTS   AGE
# pod/goumgue-dwp-56bd955644-crlsm   1/1     Running   0          14s
# pod/goumgue-dwp-56bd955644-tfghd   1/1     Running   0          14s

kubectl delete -f a02_Deployment.yml
kubectl apply -f a03_secret.yml
kubectl apply -f a02_Deployment.yml
kubectl get all -n dev 
```

#### service.yml

```yml
--- 
apiVersion: v1 
kind: Service            # what kind of resource I'm creating
metadata: 
  name: goumgue_rtp_service         # Name of my service
  namespace: dev        # Name of my namespace
spec: 
  type: NodePort            # service type use here is the nodePort (clusterIP, loadBalancer)
  selector:         # should match with matchLabels on Deployment manifest file
    app: goumgue_rtp 
  ports: 
  - nodePort: 30082   # Port where our app is accessible from the outside
    port: 80000       # Port where expose our app
    targetPort: 80000
```

```sh
kubectl apply -f a04_Service_NodePort.yml 
# service/goumgue-dwp-service created

kubectl get all -n dev
# NAME                               READY   STATUS    RESTARTS   AGE
# pod/goumgue-dwp-56bd955644-crlsm   1/1     Running   0          17m
# pod/goumgue-dwp-56bd955644-tfghd   1/1     Running   0          17m

# NAME                          TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
# service/goumgue-dwp-service   NodePort   10.100.45.45   <none>        8000:30001/TCP   11s

# NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/goumgue-dwp   2/2     2            2           17m

# NAME                                     DESIRED   CURRENT   READY   AGE
# replicaset.apps/goumgue-dwp-56bd955644   2         2         2       17m
```


#### deploy.sh

```sh
# To delete all app deploy in my dev namespace:
kubectl delete -f a01_namespace.yml 
# namespace "dev" deleted

whoami
# ec2-user
```
- I will use this file to run all my manifest files created
```sh
#!/bin/sh
kubectl apply -f namespace.yaml
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

```sh
./a05_Deploy.sh 
# namespace/dev created
# secret/jfrogdockercredential created
# deployment.apps/goumgue-dwp created
# service/goumgue-dwp-service created
```

```sh

```

```sh

```

```sh

```

```sh

```

```sh

```

```sh

```





