provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = var.cluster_role_arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name       = aws_eks_cluster.cluster.name
  node_group_name    = var.node_group_name
  subnet_ids         = var.subnet_ids
  instance_types     = var.instance_types
  capacity_type      = "ON_DEMAND" 
  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }
  node_role_arn      = "arn:aws:iam::98765432:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
}
