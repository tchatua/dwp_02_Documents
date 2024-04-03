# dwp_vpc_id = "xxx"
# dwp_pub_sub_01_id = "xxx"
dwp_pub_sub_01_id     = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_01_dev_id
# dwp_pub_sub_02_id = "xxx"
dwp_pub_sub_02_id     = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_02_dev_id


sg_ids = [aws_security_group.worker_node_sg.id]

# EKS
name = "dwp-eks"
disk_size = "20"
instance_types = ["t2.small"]
capacity_type = "ON_DEMAND"
ec2_ssh_key = "terraform_dwp.pem"

# resource "aws_eks_node_group" "backend_nodegroup" 
desired_size_backend_nodegroup = 2
max_size_backend_nodegroup = 3
min_size_backend_nodegroup = 1
max_unavailable_backend_nodegroup = 1

# resource "aws_security_group" "worker_node_sg" {
ssh_port = 22
tcp_protocol = "tcp"
my_ip_address = ""
wildcard_port = 0
minus_one_protocol_code = "-1"
internet_open_ip = ["0.0.0.0/0"]
