module "pwd_vpc_dev" {
  source = "../v01_01_vpc_module"
  # a01 Provider
  region = var.region
  # a01_02 General variables
  name          = var.name
  project       = var.project
  folder        = var.folder
  managedby     = var.managedby
  owner         = var.owner
  administrator = var.administrator
  # 02 VPC
  cidr_block_vpc = var.cidr_block_vpc
  # Public subnet 1
  cidr_block_pub_sub_1    = var.cidr_block_pub_sub_1
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone_1     = var.availability_zone_1
  # Public subnet 2
  cidr_block_pub_sub_2 = var.cidr_block_pub_sub_2
  availability_zone_2  = var.availability_zone_2
  # Public route table
  internet_open_ip = var.internet_open_ip
}
