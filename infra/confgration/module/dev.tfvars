name                        = "hyeonju-terraform"
vpc_cidr                    = "10.2.0.0/16"
secondary_cidr              = "198.18.0.0/16"
public_subnet_cidr_list     = ["10.2.10.0/24", "10.2.20.0/24"]
sec_public_subnet_cidr_list = ["198.18.10.0/24", "198.18.20.0/24"]
az_list                     = ["ap-northeast-2a", "ap-northeast-2c"]

# EKS
cluster_name                = "hyeonju-cluster"
cluster_addons_coredns      = "v1.10.1-eksbuild.11"
cluster_addons_kube_proxy   = "v1.28.8-eksbuild.5"
cluster_addons_vpc_cni      = "v1.18.2-eksbuild.1"
cluster_version             = "1.28"
eks_ng_instance_types       = ["t3.medium"]
eks_ng_min_size             = 1
eks_ng_max_size             = 1
eks_ng_desired_size         = 1

# EC2
ec2_num                     = 1
ec2_ami                     = "ami-0f7712b35774b7da2"
ec2_type                    = "t2.small"
#aml2023
ec2_key                     = "hyeonju-key-20240312"
