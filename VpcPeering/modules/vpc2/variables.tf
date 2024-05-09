variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
}

variable "vpc_name" {
  description = "Name tag for the VPC."
}

variable "enable_dns_hostnames" {
  description = "Whether the VPC has DNS hostname support."
  default     = false
}

variable "enable_dns_support" {
  description = "Whether the VPC has DNS resolution support."
  default     = false
}

variable "region" {
  description = "The AWS region."
  default     = "us-west-2"
}
