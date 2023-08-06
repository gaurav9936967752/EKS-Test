variable "eks_cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "eks_cluster_version" {
  type        = string
  description = "The Kubernetes version for the EKS cluster"
}

variable "eks_cluster_instance_type" {
  type        = string
  description = "The EC2 instance type for the EKS nodes"
}

variable "eks_cluster_desired_capacity" {
  type        = number
  description = "The desired number of EKS nodes"
}

variable "eks_cluster_min_size" {
  type        = number
  description = "The minimum number of EKS nodes"
}

variable "eks_cluster_max_size" {
  type        = number
  description = "The maximum number of EKS nodes"
}

variable "eks_cluster_subnets" {
  type        = list(string)
  description = "List of subnet IDs where EKS nodes will be launched"
}

