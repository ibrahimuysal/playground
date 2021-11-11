# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

resource "aws_eks_cluster" "eks" {
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.k8s_version
  name     = var.k8s_cluster_name
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids = [
      aws_subnet.public[0].id,
      aws_subnet.public[1].id,
      aws_subnet.private[0].id,
      aws_subnet.private[1].id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}