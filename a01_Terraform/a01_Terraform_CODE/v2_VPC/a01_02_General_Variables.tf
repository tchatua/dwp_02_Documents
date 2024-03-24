# Region
variable "region" {}

# tags: map of multiple strings
variable "name" {}
variable "project" {
  type        = string
  description = "Project"
  default     = "CICD Pipeline using Terraform, Jenkins, SonarQube, Artifactory, Ansible, Docker, Kubernetes, Helm, Prometheus and Grafana"
}
variable "folder" {
  type        = string
  description = "Folder of config files"
  default     = "a/a02_2024/d05_Udemy/d06_DevOps_Project _Workshop/dwp_02_Documents/a01_Terraform/a01_Terraform_CODE/v2_vpc"
}
variable "managedby" {
  type        = string
  description = "Create By"
  default     = "Terraform"
}
variable "owner" {
  type        = string
  description = "Project owner"
  default     = "Arristide Tchatua"
}
variable "administrator" {
  type        = string
  description = "Contact Administrator"
  default     = "tchattua@gmail.com"
}