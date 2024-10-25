# resource "aws_nat_gateway" "natgw" {
#     depends_on                  = [aws_internet_gateway.igw]
#     count                       = 1
#     allocation_id               = aws_eip.nat[0].id
#     subnet_id                   = aws_subnet.private[0].id
    
#     tags = {
#         Name                    = "natgw-${var.name}"
#         }
# }
