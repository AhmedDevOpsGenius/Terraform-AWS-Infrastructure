variable "region" {
  description = "The AWS region"
  type        = string
}

variable "cluster_name" {
  description = "The name for the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role that provides permissions for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster and node groups"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name for the EKS node group"
  type        = string
}

variable "instance_types" {
  description = "A list of instance types for the EKS worker nodes"
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of nodes in the EKS node group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of nodes in the EKS node group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of nodes in the EKS node group"
  type        = number
}
