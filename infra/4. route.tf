# route table - public으로 1개
resource "aws_route_table" "public" {
    vpc_id                  = aws_vpc.main.id
    depends_on              = [aws_vpc.main]
    tags = {
        Name                = "public-rt-${var.name}"
    }  
}

# resource "aws_route_table" "private" {
#     # count                   = length(var.private_subnet_cidr_list)
#     vpc_id                  = aws_vpc.main.id
#     depends_on              = [aws_vpc.main]
#     tags = {
#         Name                = "private-rt-${var.name}"
#     }
# }

# resource "aws_route_table" "secondary" {
#     # count                   = length(var.secondary_cidr_list )
#     vpc_id                  = aws_vpc.main.id
#     depends_on              = [aws_vpc.main]
#     tags = {
#         Name                = "secondary-rt-${var.name}"
#     }
# }


resource "aws_route" "public" {
    route_table_id          = aws_route_table.public.id
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.igw.id
}

# resource "aws_route" "private" {
#     # count                   = length(aws_nat_gateway.natgw)
#     route_table_id          = aws_route_table.private.id
#     destination_cidr_block  = "0.0.0.0/0"
#     nat_gateway_id          = aws_nat_gateway.natgw[0].id
# }

resource "aws_route_table_association" "public" {
    count                   = length(var.public_subnet_cidr_list)
    subnet_id               = aws_subnet.public[count.index].id
    route_table_id          = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
    count                   = length(var.private_subnet_cidr_list)
    subnet_id               = aws_subnet.private[count.index].id
    route_table_id          = aws_route_table.public.id
}

resource "aws_route_table_association" "secondary" {
    count                   = length(var.secondary_cidr_list)
    subnet_id               = aws_subnet.secondary[count.index].id
    route_table_id          = aws_route_table.public.id
}
