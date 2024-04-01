# 1 - Provider
variable "region" {}
# tags: map of multiple strings
variable "name" {}
variable "project" {}
variable "folder" {}
variable "managedby" {}
variable "owner" {}
variable "administrator" {}
# vpc
variable "cidr_block_vpc" {}
# Public Subnet
variable "cidr_block_pub_sub_1" {}
variable "availability_zone_1" {}
variable "cidr_block_pub_sub_2" {}
variable "availability_zone_2" {}
variable "map_public_ip_on_launch" {}
# Public Route table
variable "internet_open_ip" {}