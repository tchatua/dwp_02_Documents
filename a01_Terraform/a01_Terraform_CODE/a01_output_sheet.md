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





