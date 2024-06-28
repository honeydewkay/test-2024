module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access  = true


  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = aws_vpc.main.id
  subnet_ids               = aws_subnet.public[*].id
  control_plane_subnet_ids = aws_subnet.public[*].id
#   cloudwatch_log_group_retention_in_days = 1

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.eks_ng_instance_types 
  }

  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = var.eks_ng_instance_types 

      min_size     = var.eks_ng_min_size 
      max_size     = var.eks_ng_max_size 
      desired_size = var.eks_ng_desired_size
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # One access entry with a policy associated
    example = {
      kubernetes_groups = []
      principal_arn     = var.eks_principal_arn 

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}