provider "aws" {
  region = var.region
}

module "backend" {
  source = "../backend"
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source  = "./modules/eks"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets_ids
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "config_map_aws_auth" {
  value = module.eks.config_map_aws_auth
}

