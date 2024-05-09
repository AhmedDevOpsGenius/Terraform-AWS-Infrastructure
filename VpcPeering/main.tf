provider "aws" {
  region = var.region
}

# Create VPCs
module "vpc1" {
  source               = "./modules/vpc1"
  vpc_cidr_block       = "0.0.0.0/16"
  vpc_name             = "VPC1"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "vpc2" {
  source               = "./modules/vpc2"
  vpc_cidr_block       = "10.0.0.0/24"
  vpc_name             = "VPC2"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Use the vpc-peering module
module "vpc_peering" {
  source = "grem11n/vpc-peering/aws"
  version = "6.0.0"

  providers = {
    aws.this  = aws
    aws.peer  = aws
  }
}
