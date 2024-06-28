name                     = "hyeonju-terraform"
vpc_cidr                 = "10.2.0.0/16"
secondary_cidr           = "198.18.0.0/16"
public_subnet_cidr_list  = ["10.2.10.0/24", "10.2.20.0/24"]
private_subnet_cidr_list = ["198.18.10.0/24", "198.18.20.0/24"]
az_list                  = ["ap-northeast-2a", "ap-northeast-2c"]