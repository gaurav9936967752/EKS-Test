# Define the provider block for AWS
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

# Set up the S3 backend with state locking using DynamoDB
terraform {
  required_version = ">= 1.0.0"  # Ensure you are using Terraform version 1.0 or higher

  backend "s3" {
    bucket = "my-terraform-state-backend2103"  # Replace with the name of your S3 bucket
    key    = "terraform.tfstate"         # The name of the state file
    region = "us-east-1"                 # Replace with the AWS region of your S3 bucket

    # State locking with DynamoDB
    dynamodb_table = "terraform-table-lock2103"  # Replace with the name of your DynamoDB table
    encrypt        = true                   # Enable encryption for the state file
  }
}

# Load the VPC module
module "vpc" {
  source = "./modules/vpc"  # Replace with the actual path to your VPC module

  # Variables for the VPC module
  vpc_cidr_block = var.vpc_cidr_block
  vpc_subnets    = var.vpc_subnets
}

# Load the EKS module
module "eks_cluster" {
  source = "./modules/eks"  # Replace with the actual path to your EKS module

  # Variables for the EKS module
  eks_cluster_name          = var.eks_cluster_name
  eks_cluster_version       = var.eks_cluster_version
  eks_cluster_instance_type = var.eks_cluster_instance_type
  eks_cluster_desired_capacity = var.eks_cluster_desired_capacity
  eks_cluster_min_size      = var.eks_cluster_min_size
  eks_cluster_max_size      = var.eks_cluster_max_size
  eks_cluster_subnets       = module.vpc.public_subnets
}

