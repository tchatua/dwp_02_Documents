# # vpc
# variable "dwp_vpc_id" {
#    //default = "vpc-5f680722"
#    type = string
# }

# subnet
# variable "subnet_ids" {
#   type = list
# }
variable "subnet_ids_1" {}
variable "subnet_ids_2" {}

# security group
variable "sg_ids" {
type = string
}

# eks
variable "name" {}
variable "disk_size" {}
variable "instance_types" {}
variable "capacity_type" {}
variable "ec2_ssh_key" {}

## resource "aws_eks_node_group" "backend_nodegroup" 
variable "desired_size_backend_nodegroup" {}
variable "max_size_backend_nodegroup" {}
variable "min_size_backend_nodegroup" {}
variable "max_unavailable_backend_nodegroup" {}

# resource "aws_security_group" "worker_node_sg"
variable "vpc_id" {
   //default = "vpc-5f680722"
  type = string
}
variable "ssh_port" {}
variable "tcp_protocol" {}
variable "my_ip_address" {}
variable "wildcard_port" {}
variable "minus_one_protocol_code" {}
variable "internet_open_ip" {}








