# # data "aws_ami" "ubuntu" {
# #     most_recent             = true
# #     filter {
# #       name                  = "name"
# #       values                = ["ubuntu/images/hvm-ssd/*22.04-amd64-*"]
# #     }
# #     filter {
# #       name                  = "virtualization-type"
# #       values                = ["hvm"]
# #     }
# #     owners                  = ["amazon"]
# # }

# resource "aws_eip" "bastion_eip" {
#     domain                  = "vpc"
#     count                   = var.ec2_num
#     instance                = aws_instance.ec2[count.index].id

#     lifecycle {
#         create_before_destroy = true
#     }

#     tags = {
#         Name                = "${var.name}-ec2-eip"
#     }
# }

# resource "aws_instance" "ec2" {
#   count                     = var.ec2_num
#   ami                       = var.ec2_ami
#   instance_type             = var.ec2_type
#   # subnet_id                 = var.subnet_id_list[count.index]
#   subnet_id                 = aws_subnet.public[0].id
#   vpc_security_group_ids    = [aws_security_group.ec2.id]
#   key_name                  = var.ec2_key

#   root_block_device {
#     volume_size = 8
#     volume_type = "gp3"
#     tags = {
#       "Name" = "${var.name}-ec2-ebs"
#     }
#   }  

#   tags = {
#     Name                    = "${var.name}-ec2"
#     }
# }
