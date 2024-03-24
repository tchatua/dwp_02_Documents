resource "aws_instance" "ec2" {
  ami             = var.ami_ec2
  instance_type   = var.instance_type
  key_name        = data.aws_key_pair.my_key.key_name
  depends_on      = [aws_security_group.v1_sg]
  security_groups = [aws_security_group.v1_sg.name] # list of strings
  user_data = file("script.sh")




  tags = {
    Name          = "${var.name}-EC2"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}
