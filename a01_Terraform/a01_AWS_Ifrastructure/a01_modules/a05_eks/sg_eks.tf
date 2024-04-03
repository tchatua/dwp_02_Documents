resource "aws_security_group" "worker_node_sg" {
  name        = "${name}-eks-demo"
  description = "Allow ssh inbound traffic"
  # vpc_id      =  var.dwp_vpc_id
  vpc_id      = data.terraform_remote_state.s3_backend.outputs.dwp_vpc_dev_id

  ingress {
    description = "ssh inbound"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.my_ip_address
  }
  egress {
    description = "outbound traffic"
    from_port   = var.wildcard_port
    to_port     = var.wildcard_port
    protocol    = var.minus_one_protocol_code
    cidr_blocks = var.internet_open_ip
  }
}

