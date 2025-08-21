resource "aws_iam_role_policy_attachment" "additional_policies" {
  for_each = {
    worker_node = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    cni         = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    ecr         = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }

  policy_arn = each.value
  role       = var.node_role_name
}