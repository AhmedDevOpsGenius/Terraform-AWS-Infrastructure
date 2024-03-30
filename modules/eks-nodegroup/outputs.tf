output "cluster_name" {
  description = "The name of the created EKS cluster"
  value       = aws_eks_cluster.cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint for the created EKS cluster's API server"
  value       = aws_eks_cluster.cluster.endpoint
}

output "cluster_arn" {
  description = "The ARN of the created EKS cluster"
  value       = aws_eks_cluster.cluster.arn
}

output "node_group_name" {
  description = "The name of the created EKS node group"
  value       = aws_eks_node_group.node_group.node_group_name
}

output "node_group_arn" {
  description = "The ARN of the created EKS node group"
  value       = aws_eks_node_group.node_group.arn
}

output "node_group_cluster_name" {
  description = "The name of the cluster with which the EKS node group is associated"
  value       = aws_eks_node_group.node_group.cluster_name
}
