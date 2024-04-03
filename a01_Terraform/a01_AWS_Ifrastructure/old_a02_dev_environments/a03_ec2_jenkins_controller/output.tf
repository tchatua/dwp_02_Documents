output "jenkins_controller_instance_id" {
  value       = module.jenkins.dwp_jenkins_instance_id
  description = ""
}

output "jenkins_controller_private_ip" {
  value       = module.jenkins.dwp_jenkins_private_ip
  description = ""

}

output "jenkins_controller_public_ip" {
  value       = module.jenkins.dwp_jenkins_public_ip
  description = ""
}

output "jenkins_security_group_id" {
  value       = module.jenkins.dwp_jenkins_security_goup_id
  description = ""
}
