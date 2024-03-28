# a01 Provider
region = "us-east-1"

# a02 EC2
ami_ec2       = "ami-080e1f13689e07408"
instance_type = "t2.micro"

# a01_02 General variables
name          = "dwp-ec2"
project       = "CICD Pipeline using Terraform, Jenkins, SonarQube, Artifactory, Ansible, Docker, Kubernetes, Helm, Prometheus and Grafana"
folder        = "a/a02_2024/d05_Udemy/d06_DevOps_Project _Workshop/dwp_02_Documents/a01_Terraform/a01_Terraform_CODE/v1_EC2"
managedby     = "Terraform"
owner         = "Arristide Tchatua"
administrator = "tchattua@gmail.com"

# a03 Security Group
my_ip_address              = ["108.24.142.74/32"]
internet_open_ip           = ["0.0.0.0/0"]
ssh_port                   = 22
tcp_protocol               = "tcp"
minus_one_protocol_code    = "-1"
http_port                  = 80
https_port                 = 443
wildcard_port              = 0
jenkins_port               = 8080
greather_than_jenkins_port = 9000
