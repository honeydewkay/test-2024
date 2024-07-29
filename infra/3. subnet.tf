resource "aws_subnet" "public" {
  count                     = length(var.public_subnet_cidr_list)
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.public_subnet_cidr_list[count.index]
  availability_zone         = var.az_list[count.index]
  map_public_ip_on_launch   = true
  tags = {
    Name                    = "public-subnet-${var.name}-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                     = length(var.private_subnet_cidr_list)
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.private_subnet_cidr_list[count.index]
  availability_zone         = var.az_list[count.index]
  depends_on                = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]

  tags = {
    Name                    = "private-subnet-${var.name}-${count.index + 1}"
  }
}

