variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_subnets" {
  type        = map(list(string))
  description = "Map of subnet CIDR blocks, containing public_subnets and private_subnets"
}

