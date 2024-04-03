module "jenkins" {
  source = "../../a01_modules/a03_jenkins_controller/"
  # a02 EC2
  ami               = var.ami
  instance_type     = var.instance_type
  dwp_pub_sub_02_id = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_02_dev_id
  ansible_controller_sg_id = data.terraform_remote_state.s3_backend_ansible.outputs.ansible_security_group_id
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
  jenkins_port            = var.jenkins_port
}
