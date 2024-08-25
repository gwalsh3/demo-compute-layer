terraform {
  required_providers {
    assert = {
      source = "hashicorp/assert"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.9"
}

provider "aws" {}

data "aws_availability_zones" "ctx" {}

data "aws_caller_identity" "ctx" {}

data "aws_default_tags" "ctx" {}

data "aws_region" "ctx" {}

locals {
  azs = slice(data.aws_availability_zones.ctx.names, 0, 3)
}

data "tfe_outputs" "network" {
  organization = var.tfe_organization
  workspace    = var.tfe_workspace
}

locals {
  hosts = {
    for i, subnet in data.tfe_outputs.network.nonsensitive_values.private_subnet_ids : "web-${substr(local.azs[i], length(data.aws_region.ctx.name), length(local.azs[i]))}" => {
      subnet_id = subnet
    }
  }
}

module "ec2" {
  for_each = local.hosts
  source   = "terraform-aws-modules/ec2-instance/aws"

  name = each.key

  instance_type = "t2.micro"
  monitoring    = true
  subnet_id     = each.value.subnet_id
}
