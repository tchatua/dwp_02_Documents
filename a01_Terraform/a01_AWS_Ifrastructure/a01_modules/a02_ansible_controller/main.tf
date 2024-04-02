data "aws_key_pair" "my_key" {
  key_name = "terraform_dwp"
}

# data "aws_ami" "my_ami" {
#   most_recent = true
#   owners      = ["137112412989"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-kernel-*-x86_64-gp2"]
#   }
# }

resource "aws_instance" "ansible_ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = data.aws_key_pair.my_key.key_name
  # security_groups = [aws_security_group.ansible_sg.name] # list of strings
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  subnet_id       = var.dwp_pub_sub_01_id
  associate_public_ip_address = true
  tags = {
    Name          = "${var.name}-ec2"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
  depends_on      = [aws_security_group.ansible_sg]
}
