# Terraform Output Values : Guide & Examples

## Declaring and Using Output Values

```hcl
output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web_server.public_ip
}
```
To use outputs of nested modules from parent modules, we have to reference them as: 
module.<module_name>.<output_value_name>

### For example
 to reference the output value *instance_public_ip* that we have declared above in a module named *aws_web_server_instance* from its parent module, we have to use:

```hcl
    module.aws_web_server_instance.instance_public_ip
```
# #############################################################################################################
To define an ingress rule in an AWS security group that allows traffic from another security group, you can use Terraform to manage your AWS infrastructure. Here's how you can achieve this:

```hcl
resource "aws_security_group" "allow_from_other_sg" {
  name        = "allow_from_other_sg"
  description = "Allow inbound traffic from another security group"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    security_groups = ["${aws_security_group.source_security_group_id}"]
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  security_group_id = aws_security_group.allow_from_other_sg.id
  source_security_group_id = "your_source_security_group_id" # Specify the ID of the source security group
}
```
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################
# #############################################################################################################



