# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "public-RT"
  }
}

resource "aws_route_table" "private" {
  count  = 2
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw[count.index].id
  }

  tags = {
    "Name" = "private-RT${count.index}"
  }
}