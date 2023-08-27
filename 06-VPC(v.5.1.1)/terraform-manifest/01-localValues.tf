data "aws_availability_zones" "available" {}


locals {
  owners = var.team
  environment = var.environment

  name = "${local.owners}-${local.environment}"

  vpc_cidr = var.cidr_block
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}