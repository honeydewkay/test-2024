resource "aws_vpc" "main" {
    cidr_block                  = var.vpc_cidr
    enable_dns_support          = true
    enable_dns_hostnames        = true
    
    tags                        =   {
        Name                    = "vpc-${var.name}"
    }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.secondary_cidr
}