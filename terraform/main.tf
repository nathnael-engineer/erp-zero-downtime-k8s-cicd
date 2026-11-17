terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

resource "aws_vpc" "erp_vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name      = "erp-production-vpc"
    ManagedBy = "terraform"
  }
}

resource "aws_db_subnet_group" "erp_pg" {
  name       = "erp-postgres-subnets"
  subnet_ids = []
}
