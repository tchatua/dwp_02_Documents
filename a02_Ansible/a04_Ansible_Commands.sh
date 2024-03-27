# #############################################
#           Ansible ad hoc commands
# #############################################
# ping module
ansible all -m ping -i inventory/hosts
ansible all -m ping -i a01_hosts

# #############################################
#           Ansible playbook commands
# #############################################
# Dry run
ansible-playbook -i /opt/hots a01