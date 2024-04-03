output "ansible_controller_instance_id" {
  value = module.ansible.dwp_ansible_instance_id
  description = ""
}

output "ansible_controller_private_ip" {
  value = module.ansible.dwp_ansible_private_ip
  description = ""

}

output "ansible_controller_public_ip" {
  value = module.ansible.dwp_ansible_public_ip
  description = ""
}

output "ansible_security_group_id" {
  value = module.ansible.dwp_ansible_security_goup_id
  description = ""
}
