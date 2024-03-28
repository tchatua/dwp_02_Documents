# data "aws_subnet" "web" { // Get VPC_ID
#   id = var.subnet_id
# }

module "dwp_ec2" {
  source = "../b01_dwp_ec2_root"
  # a01 Provider
  region = var.region
  # a02 EC2
  ami           = var.ami
  instance_type = var.instance_type
  # a01_02 General variables
  name          = var.name
  project       = var.project
  folder        = var.folder
  managedby     = var.managedby
  owner         = var.owner
  administrator = var.administrator
  # a03 Security Group
  my_ip_address           = var.my_ip_address
  internet_open_ip        = var.internet_open_ip
  ssh_port                = var.ssh_port
  tcp_protocol            = var.tcp_protocol
  minus_one_protocol_code = var.minus_one_protocol_code
  http_port               = var.http_port
  https_port              = var.https_port
  wildcard_port           = var.wildcard_port
  from_8080_port          = var.from_8080_port
  to_9000_port            = var.to_9000_port
}
