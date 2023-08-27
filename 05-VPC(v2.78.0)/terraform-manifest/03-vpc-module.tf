module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.cidr_block

# VPC Basic Details
azs                 = var.azs
private_subnets = var.private_subnets
public_subnets = var.public_subnets

# Database Sunmets
  create_database_subnet_group           = var.create_database_subnet_group 
  create_database_subnet_route_table     = var.create_database_subnet_route_table
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]

# NAT Gateways - Outbount communicateion
enable_nat_gateway = var.enable_nat_gateway
single_nat_gateway = var.single_nat_gateway


# VPC DNS Parameters
enable_dns_hostnames = true
enable_dns_support = true


tags = local.common_tags
vpc_tags = local.common_tags


public_subnet_tags = {
    Name = "public-subnets"
}

private_subnet_tags = {
    Name = "private-subnets"
}

database_subnet_tags = {
    Name = "database subnets"
}


}