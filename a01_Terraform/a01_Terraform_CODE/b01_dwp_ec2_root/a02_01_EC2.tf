resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = data.aws_key_pair.my_key.key_name
  depends_on      = [aws_security_group.ec2_sg]
  security_groups = [aws_security_group.ec2_sg.name] # list of strings
  # subnet_id       = data.terraform_remote_state.s3_backend.outputs.DWP_PUBLIC_SUBNET_1_ID
  associate_public_ip_address = true
  tags = {
    Name          = "${var.name}-ec2"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}
