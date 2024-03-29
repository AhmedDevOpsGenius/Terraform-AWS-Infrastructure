variable "region" {
  description = "AWS region"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
}

variable "subnets" {
  description = "List of subnets for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "worker_instance_type" {
  description = "Instance type for worker nodes"
}

variable "worker_desired_capacity" {
  description = "Desired number of worker nodes"
}

variable "worker_max_capacity" {
  description = "Maximum number of worker nodes"
}

variable "worker_min_capacity" {
  description = "Minimum number of worker nodes"
}
