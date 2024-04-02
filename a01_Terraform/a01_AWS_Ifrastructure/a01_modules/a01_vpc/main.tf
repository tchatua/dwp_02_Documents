# vpc
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

# Public Subnets
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

# Internet Gateway 
resource "aws_internet_gateway" "dwp_igw" {
  vpc_id = aws_vpc.dwp_vpc.id
  tags = {
    Name          = "${var.name}-igw"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create a route table 
resource "aws_route_table" "dwp_public_rt" {
  vpc_id = aws_vpc.dwp_vpc.id
  route {
    cidr_block = var.internet_open_ip
    gateway_id = aws_internet_gateway.dwp_igw.id
  }
  tags = {
    Name          = "${var.name}-public-rt"
    Project       = var.project
    Folder        = var.folder
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}
# Associate subnet with route table
resource "aws_route_table_association" "dwp_rta_public_subent_1" {
  subnet_id      = aws_subnet.dwp_public_subent_01.id
  route_table_id = aws_route_table.dwp_public_rt.id
}
resource "aws_route_table_association" "dwp_rta_public_subent_2" {
  subnet_id      = aws_subnet.dwp_public_subent_02.id
  route_table_id = aws_route_table.dwp_public_rt.id
}

