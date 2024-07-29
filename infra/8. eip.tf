resource "aws_eip" "nat" {
    count                     = 1
    domain                    = "vpc"
    lifecycle {
        create_before_destroy = true
    }
    
    tags = {
        Name                    = "nat-eip-${var.name}"
  }
}