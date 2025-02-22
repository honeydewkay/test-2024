# variable "profile" {
#     type        = string   
# }

# variable "region" {
#     type        = string   
# }

variable "name" {
    type        = string
    description = "Name for resources"
    default     = "terraform"   
}
variable "name-2" {
    type        = string
    description = "Name for resources"
    default     = "terraform"   
}
variable "name-3" {
    type        = string
    description = "Name for resources"
    default     = "terraform"   
}


########## VPC ##########
variable "vpc_cidr" {
    type        = string
    description = "CIDR block for the VPC"
    default     = "10.0.0.0/16"       
}

variable "secondary_cidr" {
    type        = string
    description = "CIDR block for the VPC"      
}


# VPC additional IPv4 CIDR
variable "private_subnet_cidr_list" {
    type        = list(any)
    description = "Secondary CIDR block for the VPC"    
}

variable "public_subnet_cidr_list" {
    type        = list(any)
    description = "List of CIDR blocks for public subnets"
}

variable "secondary_cidr_list" {
    type        = list(any)
    description = "List of CIDR blocks for secondary subnets"
}



########## EKS ##########

variable "az_list" {
    type        = list(any)
    description = "List of availability zones for subnets"
    default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "The version of the EKS cluster"
}

variable "eks_create" {
  type        = string
  description = "whether creating EKS Cluster or NOT"
}

# variable "eks_mgmt_node_instance_types" {
#   type        = list(string)
#   description = "The instance types for the EKS node group"
# }

# variable "eks_mgmt_node_min_size" {
#   type        = number
#   description = "The minimum size of the EKS node group"
# }

# variable "eks_mgmt_node_max_size" {
#   type        = number
#   description = "The maximum size of the EKS node group"
# }

# variable "eks_mgmt_node_desired_size" {
#   type        = number
#   description = "The desired size of the EKS node group"
# }

# variable "eks_svc_node_instance_types" {
#   type        = list(string)
#   description = "The instance types for the EKS node group"
# }

# variable "eks_svc_node_min_size" {
#   type        = number
#   description = "The minimum size of the EKS node group"
# }

# variable "eks_svc_node_max_size" {
#   type        = number
#   description = "The maximum size of the EKS node group"
# }

# variable "eks_svc_node_desired_size" {
#   type        = number
#   description = "The desired size of the EKS node group"
# }

variable "management_node" {
  type = any
}

# variable "service_node" {
#   type = any
# }


# variable "eks_principal_arn" {
#   type        = string
#   description = "The ARN of the IAM role to assume for EKS"
# }

variable "cluster_addons_coredns" {
  type        = string
}

variable "cluster_addons_kube_proxy" {
  type        = string
}

variable "cluster_addons_vpc_cni" {
  type        = string
}

# variable "access_entries" {
#   type = map(object({
#     principal_arn = string
#   }))
#   description = "Map of access entries with ARN for the IAM roles or users"
# }

#variable "ec2_num" {
#  type        = number
#}

########## EC2 ##########

variable "ec2_ami" {
  type        = string
}

variable "ec2_type" {
  type        = string
}

variable "ec2_key" {
  type        = string
}

########## RDS ##########
# variable "rds_engine" {
#   type        = string
# }

# variable "rds_username" {
#   type        = string
# }

# variable "rds_password" {
#   type        = string
# }

# variable "rds_instance_class" {
#   type        = string
# }

