# output "ansible_instance_ids" {
#   value = module.b01_dwp_ec2_root.DWP_EC2_INSTANCE_IDS
# }

# output "private_ips" {
#   value = {
#     for instance_key, instance in aws_instance.ec2 :
#     instance_key => instance.private_ip
#   }
# }
# output "public_ips" {
#   value = {
#     for instance_key, instance in aws_instance.ec2 :
#     instance_key => instance.public_ip
#   }
# }