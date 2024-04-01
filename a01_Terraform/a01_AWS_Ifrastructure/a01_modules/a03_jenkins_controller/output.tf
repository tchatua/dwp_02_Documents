output "dwp_jenkins_instance_id" {
  value = aws_instance.jenkins_ec2.id
}

output "dwp_jenkins_private_ip" {
  value = aws_instance.jenkins_ec2.private_ip
}

output "dwp_jenkins_public_ip" {
  value = aws_instance.jenkins_ec2.public_ip
}

output "dwp_jenkins_security_goup_id" {
  value = aws_security_group.jenkins_sg.id 
}