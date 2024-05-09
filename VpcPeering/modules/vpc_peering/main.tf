provider "aws" {
  region = var.region
}

resource "aws_vpc_peering_connection" "peering" {
  vpc_id      = var.vpc1_id
  peer_vpc_id = var.vpc2_id
  auto_accept = true
}
