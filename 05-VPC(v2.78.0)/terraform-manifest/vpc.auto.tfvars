# we have used this vpc auto.tfvars to override whatever is in the vpc-variables, as terraform takes the auto.tfvars as the higher precodence 

vpc_name = "vpc-auto"
cidr_block = "10.0.0.0/16"
azs = ["eu-west-2a", "eu-west-2b"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
