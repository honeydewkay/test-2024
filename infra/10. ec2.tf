 resource "aws_instance" "ec2" {
   ami                       = var.ec2_ami
   instance_type             = var.ec2_type
   associate_public_ip_address = true
   subnet_id                 = aws_subnet.public[0].id
   vpc_security_group_ids    = [aws_security_group.ec2.id]
   key_name                  = var.ec2_key
   disable_api_termination = true
   user_data ="${file("user_data")}"

   root_block_device {
     volume_size = 8
     volume_type = "gp3"
     tags = {
       "Name" = "${var.name}-ec2-ebs"
     }
   }  

   tags = {
     Name                    = "${var.name}-server-collector"
     }
 }
 resource "aws_instance" "ec2-scouter-agent" {
   ami                       = var.ec2_ami
   instance_type             = var.ec2_type
  #  associate_public_ip_address = true
   subnet_id                 = aws_subnet.private[0].id
   vpc_security_group_ids    = [aws_security_group.ec2.id]
   key_name                  = var.ec2_key
   disable_api_termination = true
   user_data ="${file("user_data")}"

   root_block_device {
     volume_size = 8
     volume_type = "gp3"
     tags = {
       "Name" = "${var.name}-ec2-ebs"
     }
   }  

   tags = {
     Name                    = "${var.name}-agent"
     }
 }