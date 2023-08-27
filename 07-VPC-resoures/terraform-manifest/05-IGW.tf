resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "IGW: my-vpc-IGW"
  }
}
