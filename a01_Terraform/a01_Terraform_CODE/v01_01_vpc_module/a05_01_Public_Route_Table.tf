// Create a route table 
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

// Associate subnet with route table
resource "aws_route_table_association" "dwp_rta_public_subent_1" {
  subnet_id      = aws_subnet.dwp_public_subent_01.id
  route_table_id = aws_route_table.dwp_public_rt.id
}

resource "aws_route_table_association" "dwp_rta_public_subent_2" {
  subnet_id      = aws_subnet.dwp_public_subent_02.id
  route_table_id = aws_route_table.dwp_public_rt.id
}

