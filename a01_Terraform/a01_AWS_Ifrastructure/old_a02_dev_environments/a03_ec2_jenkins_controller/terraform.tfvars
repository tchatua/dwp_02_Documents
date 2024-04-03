# a01 Provider
region = "us-east-1"

# a02 EC2
ami           = "ami-033a1ebf088e56e81"
instance_type = "t2.micro"

# a01_02 General variables
name          = "dwp-jenkins-controller"
project       = "CICD Pipeline using Terraform, Jenkins, SonarQube, Artifactory, Ansible, Docker, Kubernetes, Helm, Prometheus and Grafana"
folder        = "a/a02_2024/d05_Udemy/d06_DevOps_Project _Workshop/dwp_02_Documents/a01_Terraform/a01_Terraform_CODE/b02_dwp_ansible"
managedby     = "Terraform"
owner         = "Arristide Tchatua"
administrator = "tchattua@gmail.com"

# a03 Security Group
my_ip_address           = ["108.24.142.74/32"]
internet_open_ip        = ["0.0.0.0/0"]
ssh_port                = 22
tcp_protocol            = "tcp"
minus_one_protocol_code = "-1"
wildcard_port           = 0
jenkins_port            = 8080

ansible_controller_sg_id = "ansible_controller_sg_id"
