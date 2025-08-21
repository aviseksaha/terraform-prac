output "node_role_name" {
  description = "Name of the IAM role for the node group"
  value       = aws_iam_role.node_group.name
}