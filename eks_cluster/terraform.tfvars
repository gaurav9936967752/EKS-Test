# Variable values for VPC module
vpc_cidr_block = "10.0.0.0/16"

vpc_subnets = {
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
}

# Variable values for EKS module
eks_cluster_name          = "my-eks-cluster"
eks_cluster_version       = "1.23"
eks_cluster_instance_type = "t2.small"
eks_cluster_desired_capacity = 2
eks_cluster_min_size      = 2
eks_cluster_max_size      = 4

