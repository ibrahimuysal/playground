# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "eks_worker_node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks_worker_node_group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = aws_subnet.private[*].id

  ami_type = "AL2_x86_64"
  instance_types = [
    "t3.medium",
  ]
  capacity_type = "ON_DEMAND"
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  update_config {
    max_unavailable = "1"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only,
  ]

  labels = {
    role = "WorkerNode"
  }
}