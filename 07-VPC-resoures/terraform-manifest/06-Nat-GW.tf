resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)
  domain   = "vpc"
  tags = {
    Name = "EIP: for ope project"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.cidr_private_subnet)
  depends_on = [ aws_eip.nat_eip ]
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.my_vpc_private_subnets[count.index].id
  tags = {
    "Name" = "Private Nat-GW: for ope project"
  }
}