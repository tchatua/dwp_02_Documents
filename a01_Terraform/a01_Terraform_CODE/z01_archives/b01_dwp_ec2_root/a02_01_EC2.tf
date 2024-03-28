resource "aws_instance" "ec2" {
  ami             = var.ami_ec2
  instance_type   = var.instance_type
  key_name        = data.aws_key_pair.my_key.key_name
  depends_on      = [aws_security_group.v1_sg]
  security_groups = [aws_security_group.v1_sg.name] # list of strings
  for_each        = toset(["jenkin-controller", "jenkins-worker-node", "ansible-controller"])
  # subnet_id                   = data.terraform_remote_state.s3_backend.outputs.dwp_pub_sub_01_id
  associate_public_ip_address = true
  tags = {
    Name          = "${each.key}"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}
