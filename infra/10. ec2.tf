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
     Name                    = "${var.name}-ec2"
     }
 }

# resource "aws_instance" "ec2-2" {
#    ami                       = var.ec2_ami
#    instance_type             = var.ec2_type
#    associate_public_ip_address = true
#    subnet_id                 = aws_subnet.public[0].id
#    vpc_security_group_ids    = [aws_security_group.ec2.id]
#    key_name                  = var.ec2_key
#    disable_api_termination = true
#    user_data ="${file("user_data")}"

#    root_block_device {
#      volume_size = 8
#      volume_type = "gp3"
#      tags = {
#        "Name" = "${var.name-2}-ec2-ebs"
#      }
#    }  
#    tags = {
#      Name                    = "${var.name-2}-ec2"
#      }
#  }

# resource "aws_instance" "ec2-3" {
#    ami                       = var.ec2_ami
#    instance_type             = var.ec2_type
#    associate_public_ip_address = true
#    subnet_id                 = aws_subnet.public[0].id
#    vpc_security_group_ids    = [aws_security_group.ec2.id]
#    key_name                  = var.ec2_key
#    disable_api_termination = true
#    user_data ="${file("user_data")}"

#    root_block_device {
#      volume_size = 8
#      volume_type = "gp3"
#      tags = {
#        "Name" = "${var.name-3}-ec2-ebs"
#      }
#    }  
#    tags = {
#      Name                    = "${var.name-3}-ec2"
#      }
#  } 
 

# resource "aws_instance" "ec2-added" {
#     ami = var.ec2-added_ami
#     instance_type = var.ec2-added_type

#     # user_data가 변경되더라도 인스턴스를 재생성하지 않고 업데이트만 함.
#     # false는 재생성 안함, true는 재생성 함
#     user_data_replace_on_change = false
#     tags = {
#      Name                    = "hyeonju-ec2-added"
#      }
# } 