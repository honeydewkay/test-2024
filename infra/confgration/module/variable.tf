variable "name" {
    type        = string
    description = "Name for resources"
    default     = "hyeonju-terraform"   
}

# VPC
variable "vpc_cidr" {
    type        = string
    description = "CIDR block for the VPC"
    default     = "10.2.0.0/16"       
}

# VPC additional IPv4 CIDR
variable "secondary_cidr" {
    type        = string
    description = "Secondary CIDR block for the VPC"
    default     = "198.18.0.0/16"       
}

# Subnet
variable "public_subnet_cidr_list" {
    type        = list
    description = "List of CIDR blocks for public subnets"
    default     = ["10.2.10.0/24", "10.2.20.0/24"]
}

variable "private_subnet_cidr_list" {
    type        = list
    description = "List of CIDR blocks for private subnets"
    default     = ["198.18.10.0/24", "198.18.20.0/24"]
}

variable "az_list" {
    type        = list
    description = "List of availability zones for subnets"
    default     = ["ap-northeast-2a", "ap-northeast-2c"]
}
