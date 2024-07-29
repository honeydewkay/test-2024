module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  create          = true
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access  = true

  vpc_id                   = aws_vpc.main.id
  subnet_ids               = aws_subnet.public[*].id
  control_plane_subnet_ids = aws_subnet.public[*].id
  cloudwatch_log_group_retention_in_days = 1

  

# eksctl utils describe-addon-versions --kubernetes-version 1.27 --name vpc-cni | grep Version | head -n 10 # 클러스터 버전별 권장 에드온 버전 확인
  cluster_addons = {
    coredns                = {
      addon_version = var.cluster_addons_coredns 
	  resolve_conflicts = "PRESERVE"
    }
    # eks-pod-identity-agent = {}
    kube-proxy             = {
      addon_version = var.cluster_addons_kube_proxy
	  resolve_conflicts = "PRESERVE"
    }
    vpc-cni                = {
      addon_version = var.cluster_addons_vpc_cni 
	  resolve_conflicts = "PRESERVE"
    }
  }

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.eks_ng_instance_types 
	update_launch_template_default_version = true
  }

  eks_managed_node_groups = {
    hyeonju-node-group = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = var.eks_ng_instance_types 

      min_size     = var.eks_ng_min_size 
      max_size     = var.eks_ng_max_size 
      desired_size = var.eks_ng_desired_size
    }
  }

  enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = "test"
    Terraform   = "true"
  }
}