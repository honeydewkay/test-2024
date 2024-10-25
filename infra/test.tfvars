########## VPC ##########

name                        = "hyeonju-terraform"
name-2 = "hyeonju-terraform-2"
name-3 = "hyeonju-terraform-3"
vpc_cidr                    = "10.2.0.0/16"
secondary_cidr              = "198.18.0.0/16"
public_subnet_cidr_list     = ["10.2.10.0/24", "10.2.20.0/24"]
private_subnet_cidr_list    = ["10.2.30.0/24", "10.2.40.0/24"]
secondary_cidr_list         = ["198.18.10.0/24", "198.18.20.0/24"]
az_list                     = ["ap-northeast-2a", "ap-northeast-2c"]

########## EKS ##########

cluster_name                = "hyeonju-cluster"

# 1.28
cluster_addons_coredns      = "v1.10.1-eksbuild.11"
cluster_addons_kube_proxy   = "v1.28.8-eksbuild.5"
cluster_addons_vpc_cni      = "v1.18.3-eksbuild.1"
cluster_version             = "1.28"

# 1.29
# cluster_addons_coredns      = "v1.10.1-eksbuild.11"
# cluster_addons_kube_proxy   = "v1.28.8-eksbuild.5"
# cluster_addons_vpc_cni      = "v1.18.3-eksbuild.1"
# cluster_version             = "1.29"

# 1.30
# cluster_addons_coredns      = "v1.11.1-eksbuild.9"
# cluster_addons_kube_proxy   = "v1.30.0-eksbuild.3"
# cluster_addons_vpc_cni      = "v1.18.2-eksbuild.1"
# cluster_version             = "1.30"

# eks_mgmt_node_instance_types      = ["t2.small"]
# eks_mgmt_node_min_size            = 1
# eks_mgmt_node_max_size            = 1
# eks_mgmt_node_desired_size        = 1

# eks_svc_node_instance_types      = ["t3.small"]
# eks_svc_node_min_size            = 1
# eks_svc_node_max_size            = 1
# eks_svc_node_desired_size        = 1

management_node = {
  min_size       = 1,
  max_size       = 1,
  instance_types = ["t3.small"]
}

# service_node = {
#   min_size       = 1,
#   max_size       = 1,
#   instance_types = ["t3.small"]
# }

eks_create                  = true

########## EC2 ##########

#ec2_num                     = 1
ec2_ami                     = "ami-0023481579962abd4" 
ec2_type                    = "t3.small"
ec2_key                     = "hyeonju-key-20240312"

# ec2-added_ami = "ami-008d41dbe16db6778"
# ec2-added_type = "t3.micro"

########## RDS ##########

# rds_engine = "mysql"
# rds_username = "admin"
# rds_password = "adminAdmin"
# rds_instance_class = "db.t3.micro"