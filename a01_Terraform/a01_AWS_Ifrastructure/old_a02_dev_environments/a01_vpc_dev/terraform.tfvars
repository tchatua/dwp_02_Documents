# a01 Provider
region = "us-east-1"
# a01_02 General variables
name          = "dwp-dev"
project       = "CICD Pipeline using Terraform, Jenkins, SonarQube, Artifactory, Ansible, Docker, Kubernetes, Helm, Prometheus and Grafana"
folder        = "a/a02_2024/d05_Udemy/d06_DevOps_Project _Workshop/dwp_02_Documents/a01_Terraform/a01_Terraform_CODE/a02_dwp_vpc_dev"
managedby     = "Terraform"
owner         = "Arristide Tchatua"
administrator = "tchattua@gmail.com"
# 02 VPC
cidr_block_vpc = "192.168.0.0/16"
# Public subnet 1
cidr_block_pub_sub_1    = "192.168.10.0/24"
map_public_ip_on_launch = "true"
availability_zone_1     = "us-east-1a"
# Public subnet 2
cidr_block_pub_sub_2 = "192.168.20.0/24"
availability_zone_2  = "us-east-1b"
# Public route table
internet_open_ip = "0.0.0.0/0"