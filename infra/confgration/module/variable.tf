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
