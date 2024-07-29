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

 resource "aws_vpc_security_group_ingress_rule" "allow_22" {
   security_group_id = aws_security_group.ec2.id
   cidr_ipv4         = "0.0.0.0/0"
   from_port         = 1022
   ip_protocol       = "tcp"
   to_port           = 1022
   description       = "Bespin_Office"
 }

 resource "aws_vpc_security_group_egress_rule" "allow_all_bastion" {
   security_group_id = aws_security_group.ec2.id
   cidr_ipv4         = "0.0.0.0/0"
   ip_protocol       = "-1" # semantically equivalent to all ports
 }
