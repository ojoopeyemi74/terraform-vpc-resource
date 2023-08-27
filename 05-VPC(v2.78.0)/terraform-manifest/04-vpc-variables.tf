variable "vpc_name" {
  description = "VPC name"
  type = string
  default = "my-vpc"
}

variable "cidr_block" {
  description = "cidr block"
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "availability zones"
  type = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "database_subnets" {
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

variable "create_database_subnet_group" {
  type = bool
  default = true
}

variable "create_database_subnet_route_table" {
  type = bool
  default = true
}

variable "enable_nat_gateway" {
  type = bool
  default = true
}

variable "single_nat_gateway" {
  type = bool
  default = true
}