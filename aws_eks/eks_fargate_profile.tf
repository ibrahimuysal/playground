# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_fargate_profile

resource "aws_eks_fargate_profile" "eks_fargate" {
  cluster_name           = aws_eks_cluster.eks.name
  fargate_profile_name   = "eks_fargate"
  pod_execution_role_arn = aws_iam_role.fargate_role.arn
  subnet_ids             = aws_subnet.private[*].id

  selector {
    namespace = "fargate"
  }
}