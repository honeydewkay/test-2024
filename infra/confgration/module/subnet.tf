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

resource "aws_subnet" "sec_public" {
  count                     = length(var.sec_public_subnet_cidr_list)
  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.sec_public_subnet_cidr_list[count.index]
  availability_zone         = var.az_list[count.index]
  tags = {
    Name                    = "secondary-public-subnet-${var.name}-${count.index + 1}"
  }
}

