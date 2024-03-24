resource "aws_vpc" "dwp_vpc" {
  cidr_block = var.cidr_block_vpc

  tags = {
    Name          = "${var.name}-vpc"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}