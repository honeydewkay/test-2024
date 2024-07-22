# resource "aws_security_group" "ec2" {
#   name        = "${var.name}-ec2-sg"
#   description = "Allow Bespin Access"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "${var.name}-ec2-sg"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_22" {
#   security_group_id = aws_security_group.ec2.id
#   cidr_ipv4         = "165.225.0.0/16"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
#   description       = "Bespin_Office"
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_bastion" {
#   security_group_id = aws_security_group.ec2.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

resource "aws_security_group" "example" {
  vpc_id      = aws_vpc.main.id
}
