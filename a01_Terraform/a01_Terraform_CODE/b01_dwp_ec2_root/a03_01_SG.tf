resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-sg"
  description = "Allow the internet traffic"
  # vpc_id      = data.terraform_remote_state.s3_backend.outputs.VPC_ID
  tags = {
    Name = "${var.name}-sg"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
  ingress {
    description = "ssh inbound"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.my_ip_address
  }

  ingress {
    description = "http inbound"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.internet_open_ip
  }

  ingress {
    description = "https inbound"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.internet_open_ip
  }
  ingress {
    description = "from 8080 to 9000 inbound"
    from_port   = var.from_8080_port
    to_port     = var.to_9000_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.internet_open_ip
  }

  egress {
    description = "outbound traffic"
    from_port   = var.wildcard_port
    to_port     = var.wildcard_port
    protocol    = var.minus_one_protocol_code
    cidr_blocks = var.internet_open_ip
  }
}
