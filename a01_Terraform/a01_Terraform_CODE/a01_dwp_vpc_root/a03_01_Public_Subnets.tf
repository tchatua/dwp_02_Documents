//Create a Subnet 
resource "aws_subnet" "dwp_public_subent_01" {
  vpc_id                  = aws_vpc.dwp_vpc.id
  cidr_block              = var.cidr_block_pub_sub_1
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone_1

  tags = {
    Name          = "${var.name}-pub-sub-1"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

resource "aws_subnet" "dwp_public_subent_02" {
  vpc_id                  = aws_vpc.dwp_vpc.id
  cidr_block              = var.cidr_block_pub_sub_2
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone_2

  tags = {
    Name          = "${var.name}-pub-sub-2"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

