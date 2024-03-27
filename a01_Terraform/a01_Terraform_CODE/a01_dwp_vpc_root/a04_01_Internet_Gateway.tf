//Creating an Internet Gateway 
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