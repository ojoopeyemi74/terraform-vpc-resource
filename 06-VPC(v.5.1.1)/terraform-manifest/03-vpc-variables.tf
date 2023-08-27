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