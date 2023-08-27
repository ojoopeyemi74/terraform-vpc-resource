locals {
  owners = var.team
  environment = var.environment

  name = "${local.owners}-${local.environment}"
  
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}