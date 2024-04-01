resource "aws_security_group" "ansible_sg" {
  name        = var.name_ansible_sg
  description = "Allow the internet traffic"
  vpc_id      = data.terraform_remote_state.s3_backend.outputs.dwp_vpc_dev_id
  tags = {
    Name = "${var.name}-SG"
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

  egress {
    description = "outbound traffic"
    from_port   = var.wildcard_port
    to_port     = var.wildcard_port
    protocol    = var.minus_one_protocol_code
    cidr_blocks = var.internet_open_ip
  }
}

resource "aws_security_group_rule" "sec_group_allow_tcp" {
  type              = "ingress"
  from_port         = 22 // first part of port range 
  to_port           = 22 // second part of port range
  protocol          = "tcp" // Protocol, could be "tcp" "udp" etc. 
  security_group_id = "${aws_security_group.ansible_sg.id}" // Which group to attach it to
  source_security_group_id = "${aws_security_group.ansible_sg.id}" // Which group to specify as source
}

