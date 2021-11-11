# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat" {
  count      = 2
  depends_on = [aws_internet_gateway.igw]
}