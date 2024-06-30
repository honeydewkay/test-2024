name                     = "hyeonju-terraform"
vpc_cidr                 = "10.2.0.0/16"
secondary_cidr           = "198.18.0.0/16"
public_subnet_cidr_list  = ["10.2.10.0/24", "10.2.20.0/24"]
private_subnet_cidr_list = ["198.18.10.0/24", "198.18.20.0/24"]
az_list                  = ["ap-northeast-2a", "ap-northeast-2c"]

# EKS
cluster_name                = "hyeonju-cluster"
cluster_addons_coredns      = "v1.10.1-eksbuild.11"
cluster_addons_kube_proxy  = "v1.28.8-eksbuild.5"
cluster_addons_vpc_cni      = "v1.18.2-eksbuild.1"
cluster_version             = "1.28"
eks_ng_instance_types       = ["t3.medium"]
eks_ng_min_size             = 1
eks_ng_max_size             = 1
eks_ng_desired_size         = 1
eks_principal_arn           = "arn:aws:iam::386474451889:user/hyeonju.kim@bespinglobal.com"

# access_entries = {
#   role = {
#     principal_arn = "arn:aws:iam::386474451889:role/hyeonju-eks-cluster-role"
#   },
#   user = {
#     principal_arn = "arn:aws:iam::386474451889:user/hyeonju.kim@bespinglobal.com"
#   }
# }