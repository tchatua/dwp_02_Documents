output "maven_controller_instance_id" {
  value       = module.maven.dwp_maven_instance_id
  description = ""
}

output "maven_controller_private_ip" {
  value       = module.maven.dwp_maven_private_ip
  description = ""

}

output "maven_controller_public_ip" {
  value       = module.maven.dwp_maven_public_ip
  description = ""
}

output "maven_security_group_id" {
  value       = module.maven.dwp_maven_security_goup_id
  description = ""
}
