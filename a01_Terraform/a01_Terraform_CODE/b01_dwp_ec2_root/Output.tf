# output "DWP_EC2_INSTANCE_IDS" {
#   value = aws_instance.ec2.id
# }

# output "DWP_EC2_PRIVATE_IPS" {
#   value = aws_instance.ec2.private_ip
# }
# output "DWP_EC2_PUBLIC_IPS" {
#   value = aws_instance.ec2.public_ip
# }

# ###############################################
# vpc dev outputs
# output "DWP_VPC_DEV_ID" {
#   value = module.pwd_vpc_dev.dwp_vpc_id
# }

# output "DWP_PUBLIC_SUBNET_1_ID_DEV" {
#   value =   data.terraform_remote_state.s3_backend.DWP_PUBLIC_SUBNET_1_ID 
# }

# output "DWP_PUBLIC_SUBNET_2_ID" {
#   value = module.pwd_vpc_dev.dwp_pub_sub_02_id
# }