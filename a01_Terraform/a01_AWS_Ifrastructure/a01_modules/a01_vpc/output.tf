output "dwp_vpc_id" {
  value       = aws_vpc.dwp_vpc.id 
  description = ""
}

output "dwp_pub_sub_01_id" {
  value       = aws_subnet.dwp_public_subent_01.id
  description = ""
}

output "dwp_pub_sub_02_id" {
  value       = aws_subnet.dwp_public_subent_02.id
  description = ""
}