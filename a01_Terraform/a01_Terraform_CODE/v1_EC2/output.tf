output "instance_ids" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.id
  }
}

output "private_ips" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.private_ip
  }
}
output "public_ips" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.public_ip
  }
}