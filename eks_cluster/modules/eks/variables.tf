variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
}

variable "subnets" {
  description = "The private subnet IDs for the EKS cluster nodes."
}
