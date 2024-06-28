variable "name" {
    type        = string
    description = "Name for resources"
    default     = "terraform"   
}

# VPC
variable "vpc_cidr" {
    type        = string
    description = "CIDR block for the VPC"
    default     = "10.0.0.0/16"       
}

# VPC additional IPv4 CIDR
variable "secondary_cidr" {
    type        = string
    description = "Secondary CIDR block for the VPC"    
}

# Subnet
variable "public_subnet_cidr_list" {
    type        = list(any)
    description = "List of CIDR blocks for public subnets"
}

variable "private_subnet_cidr_list" {
    type        = list(any)
    description = "List of CIDR blocks for private subnets"
}

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

variable "eks_ng_instance_types" {
  type        = list(string)
  description = "The instance types for the EKS node group"
}

variable "eks_ng_min_size" {
  type        = number
  description = "The minimum size of the EKS node group"
}

variable "eks_ng_max_size" {
  type        = number
  description = "The maximum size of the EKS node group"
}

variable "eks_ng_desired_size" {
  type        = number
  description = "The desired size of the EKS node group"
}

variable "eks_principal_arn" {
  type        = string
  description = "The ARN of the IAM role to assume for EKS"
}

# variable "access_entries" {
#   type = map(object({
#     principal_arn = string
#   }))
#   description = "Map of access entries with ARN for the IAM roles or users"
# }