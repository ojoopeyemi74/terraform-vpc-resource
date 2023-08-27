variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "keypair" {
  default = "terraform-key-eu-west-2"
}

# we will be using List in the variable
variable "instance_type_list" {
  description = "for instance type list"
  default = ["t2.micro", "t3.medium", "t3.small"]
}

# we will be using Map in the variable for instance type
variable "instance_type_map" {
  description = "for instance type Map"
  default = {
    dev = "t2.micro"
    qa  = "t3.medium"
    prod = "t3.small"
  }
}