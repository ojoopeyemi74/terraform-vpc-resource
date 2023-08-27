# Public Subnets
resource "aws_subnet" "my_vpc_public_subnets" {
  count = length(var.cidr_public_subnet)
  vpc_id = aws_vpc.vpc_terraform.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "Subnet-Public: Public-Subnet ${count.index +1}"
  }
}

# Private subnets
resource "aws_subnet" "my_vpc_private_subnets" {
  count = length(var.cidr_private_subnet)
  vpc_id = aws_vpc.vpc_terraform.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "Subnet-Private: Private-Subnet ${count.index +1}"
  }
}