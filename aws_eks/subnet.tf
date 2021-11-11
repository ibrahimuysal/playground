# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 4, count.index)

  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-${data.aws_availability_zones.available.names[count.index]}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 4, count.index + 2)

  tags = {
    Name                              = "private-${data.aws_availability_zones.available.names[count.index]}"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}