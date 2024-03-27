output "DWP_VPC_DEV_ID" {
  value = module.pwd_vpc_dev.dwp_vpc_id
}

output "DWP_PUBLIC_SUBNET_1_ID" {
  value = module.pwd_vpc_dev.dwp_pub_sub_01_id
}

output "DWP_PUBLIC_SUBNET_2_ID" {
  value = module.pwd_vpc_dev.dwp_pub_sub_02_id
}

# output "DWP_PUBLIC_SUBNET_1_ID_DEV" {
#   value =   data.terraform_remote_state.s3_backend.DWP_PUBLIC_SUBNET_1_ID 
# }
