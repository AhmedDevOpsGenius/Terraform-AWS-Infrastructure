output "group_names" {
  description = "Names of the created IAM groups."
  value       = aws_iam_group.this[*].name
}

output "group_arns" {
  description = "ARNs of the created IAM groups."
  value       = aws_iam_group.this[*].arn
}

