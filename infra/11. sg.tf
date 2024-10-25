 resource "aws_security_group" "ec2" {
   name        = "${var.name}-ec2-sg"
   description = "Allow My Access"
   vpc_id      = aws_vpc.main.id

   tags = {
     Name = "${var.name}-ec2-sg"
   }
   lifecycle {
    create_before_destroy = true
   }
 }

#  resource "aws_security_group_rule" "allow_22" {
#    count = var.name-3 == "hyeonju-terraform-3" ? 0 : 1 
#    cidr_blocks = [ var.name == "hyeonju-terraform" ? "1.1.1.1/32" : ( var.name-2 == "hyeonju-terraform-2" ? "2.2.2.2/32" : [] ) ]
#    security_group_id = aws_security_group.ec2.id
#   #  cidr_blocks         = ["0.0.0.0/0"]
#    from_port         = 1022
#    protocol       = "tcp"
#    to_port           = 1022
#    type              = "ingress"
#    description       = "anyopen"
#  }

#  resource "aws_security_group_rule" "allow_22_1" {
#    count = var.name-3 == "hyeonju-terraform-3" ? 1 : 0 
#    cidr_blocks = ["2.2.2.2/32"] 
#    security_group_id = aws_security_group.ec2.id
#   #  cidr_blocks         = ["0.0.0.0/0"]
#    from_port         = 1022
#    protocol       = "tcp"
#    to_port           = 1022
#    type              = "ingress"
#    description       = "anyopen"
#  }

  resource "aws_security_group_rule" "allow_22_2" {
   count = 1
   security_group_id = aws_security_group.ec2.id
   cidr_blocks         = ["0.0.0.0/0"]
   from_port         = 1022
   protocol       = "tcp"
   to_port           = 1022
   type              = "ingress"
   description       = "anyopen"
 }

  resource "aws_security_group_rule" "allow_80" {
   security_group_id = aws_security_group.ec2.id
   cidr_blocks         = ["0.0.0.0/0"]
   from_port         = 80
   protocol       = "tcp"
   to_port           = 80
   type              = "ingress"
   description       = "80"
 }

   resource "aws_security_group_rule" "allow_443" {
   security_group_id = aws_security_group.ec2.id
   cidr_blocks         = ["0.0.0.0/0"]
   from_port         = 443
   protocol       = "tcp"
   to_port           = 443
   type              = "ingress"
   description       = "443"
 }

    resource "aws_security_group_rule" "allow_all" {
   security_group_id = aws_security_group.ec2.id
   cidr_blocks         = ["0.0.0.0/0"]
   from_port         = 0
   protocol       = "tcp"
   to_port           = 65535
   type              = "egress"
   description       = "443"
 }

# resource "aws_security_group" "cluster" {
#   count = 1
#   name        = 
#   description = "test"
#   vpc_id      = var.vpc_cidr


#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group_rule" "cluster" {
#   # Required
#   security_group_id = aws_security_group.cluster[0].id
#   protocol          = "tcp"
#   from_port         = 0
#   to_port           = 65535
#   type              = "egress"
# }


