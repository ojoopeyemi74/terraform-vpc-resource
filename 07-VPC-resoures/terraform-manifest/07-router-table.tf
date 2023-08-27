# Public-route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "RT-Public: Ope's project"
  }
}

# Private route table
resource "aws_route_table" "private_route_table"{
    vpc_id = aws_vpc.vpc_terraform.id
    count = length(var.cidr_private_subnet)
    depends_on = [ aws_nat_gateway.nat_gateway ]
    route{
        cidr_block="0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
    }
    tags = {
      Name = "RT-private: ope's project"
    }
}