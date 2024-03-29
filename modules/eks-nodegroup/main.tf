provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source           = "terraform-aws-modules/eks/aws"
  version          = "17.2.0"
  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  subnets          = var.subnets
  vpc_id           = var.vpc_id
}

module "eks-node-group" {
  source           = "cloudposse/eks-node-group/aws"
  version          = "2.12.0"
  cluster_name     = module.eks_cluster.cluster_id
  subnet_ids       = var.subnets
  max_size         = var.worker_max_capacity
  min_size         = var.worker_min_capacity
  desired_size     = var.worker_desired_capacity
}
