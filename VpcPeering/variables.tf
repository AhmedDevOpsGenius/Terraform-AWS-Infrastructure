variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
}

variable "vpc_name" {
  description = "Name tag for the VPC."
}

variable "region" {
  description = "The AWS region."
  default     = "us-west-2"
}
