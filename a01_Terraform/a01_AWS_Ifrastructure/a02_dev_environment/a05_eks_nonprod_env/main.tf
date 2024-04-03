module "eks" {
  source = "../../a01_modules/a05_eks/"
  # dwp_vpc_id = "xxx"
  # dwp_pub_sub_01_id = "xxx"
  subnet_ids_1 = var.subnet_ids_1
  subnet_ids_2 = var.subnet_ids_2
#   dwp_pub_sub_01_id = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_01_dev_id
  # dwp_pub_sub_02_id = "xxx"
#   dwp_pub_sub_02_id = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_02_dev_id
  sg_ids            = [aws_security_group.worker_node_sg.id]
  # EKS
  name           = var.name
  disk_size      = var.disk_size
  instance_types = var.instance_types
  capacity_type  = var.capacity_type
  ec2_ssh_key    = var.ec2_ssh_key
  # resource "aws_eks_node_group" "backend_nodegroup" 
  desired_size_backend_nodegroup    = var.desired_size_backend_nodegroup
  max_size_backend_nodegroup        = var.max_size_backend_nodegroup
  min_size_backend_nodegroup        = var.min_size_backend_nodegroup
  max_unavailable_backend_nodegroup = var.max_unavailable_backend_nodegroup
  # resource "aws_security_group" "worker_node_sg" 
  ssh_port                = var.ssh_port
  tcp_protocol            = var.tcp_protocol
  my_ip_address           = var.my_ip_address
  wildcard_port           = var.wildcard_port
  minus_one_protocol_code = var.minus_one_protocol_code
  internet_open_ip        = var.internet_open_ip
}