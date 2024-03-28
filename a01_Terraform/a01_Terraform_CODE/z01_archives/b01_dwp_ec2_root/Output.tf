output "DWP_INSTANCE_IDS" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.id
  }
}

output "DWP_PRIVATE_IPS" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.private_ip
  }
}
output "DWP_PUBLIC_IPS" {
  value = {
    for instance_key, instance in aws_instance.ec2 :
    instance_key => instance.public_ip
  }
}