resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = "VPC: ope-eu-west-2"
  }
}