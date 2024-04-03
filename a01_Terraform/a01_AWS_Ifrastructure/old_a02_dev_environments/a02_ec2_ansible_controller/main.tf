module "ansible" {
  source = "../../a01_modules/a02_ansible_controller/"
  # a01 Provider
  # a02 EC2
  ami           = var.ami
  instance_type = var.instance_type
  dwp_pub_sub_01_id     = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_01_dev_id
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
  wildcard_port           = var.wildcard_port
  name_ansible_sg = var.name_ansible_sg
}
