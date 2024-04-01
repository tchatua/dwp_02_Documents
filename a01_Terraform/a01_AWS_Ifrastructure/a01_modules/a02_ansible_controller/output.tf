output "dwp_ansible_instance_id" {
  value = aws_instance.ansible_ec2.id
}

output "dwp_ansible_private_ip" {
  value = aws_instance.ansible_ec2.private_ip
}

output "dwp_ansible_public_ip" {
  value = aws_instance.ansible_ec2.public_ip
}

output "dwp_ansible_security_goup_id" {
  value = aws_security_group.ansible_sg.id 
}