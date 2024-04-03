resource "aws_security_group" "worker_node_sg" {
  name        = "eks-test"
  description = "Allow ssh inbound traffic"
  vpc_id      = "vpc-0f2eff61f9493a41b" # ###########################

  ingress {
    description = "ssh access to public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "maven_kubernetes_group_allow_tcp" {
  type              = "ingress"
  from_port         = 22                                   // first part of port range 
  to_port           = 22                                   // second part of port range
  protocol          = "tcp"                                // Protocol, could be "tcp" "udp" etc. 
  security_group_id = aws_security_group.worker_node_sg.id // Which group to attach it to
  # source_security_group_id = var.ansible_controller_sg_id #"${module.ansible_security_group_id.ansible.id}" // Which group to specify as source
  # source_security_group_id = data.terraform_remote_state.s3_backend_ansible.outputs.ansible_security_group_id
  source_security_group_id = "sg-06862df16b70543cd"
}

resource "aws_security_group_rule" "jenkins_kubernetes_group_allow_tcp" {
  type              = "ingress"
  from_port         = 22                                   // first part of port range 
  to_port           = 22                                   // second part of port range
  protocol          = "tcp"                                // Protocol, could be "tcp" "udp" etc. 
  security_group_id = aws_security_group.worker_node_sg.id // Which group to attach it to
  # source_security_group_id = var.ansible_controller_sg_id #"${module.ansible_security_group_id.ansible.id}" // Which group to specify as source
  # source_security_group_id = data.terraform_remote_state.s3_backend_ansible.outputs.ansible_security_group_id
  source_security_group_id = "sg-0119c51c1e0c5bb9f"
}

resource "aws_security_group_rule" "ansible_kubernetes_group_allow_tcp" {
  type              = "ingress"
  from_port         = 22                                   // first part of port range 
  to_port           = 22                                   // second part of port range
  protocol          = "tcp"                                // Protocol, could be "tcp" "udp" etc. 
  security_group_id = aws_security_group.worker_node_sg.id // Which group to attach it to
  # source_security_group_id = var.ansible_controller_sg_id #"${module.ansible_security_group_id.ansible.id}" // Which group to specify as source
  # source_security_group_id = data.terraform_remote_state.s3_backend_ansible.outputs.ansible_security_group_id
  source_security_group_id = "sg-01cd978bc2d79bc01"
}
