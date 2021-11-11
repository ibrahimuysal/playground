# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.dns_hostname
  enable_dns_support   = var.dns_support

  tags = {
    "Name" = "EKS-VPC"
  }
}
