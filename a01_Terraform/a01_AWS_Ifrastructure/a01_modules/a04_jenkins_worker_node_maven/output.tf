output "dwp_maven_instance_id" {
  value = aws_instance.maven_ec2.id
}

output "dwp_maven_private_ip" {
  value = aws_instance.maven_ec2.private_ip
}

output "dwp_maven_public_ip" {
  value = aws_instance.maven_ec2.public_ip
}

output "dwp_maven_security_goup_id" {
  value = aws_security_group.maven_sg.id 
}