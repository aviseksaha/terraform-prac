terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.provider_block
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr       = var.vpc_cidr
  azs            = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  environment    = var.environment
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  environment     = var.environment
}

module "node_group" {
  source = "./modules/node_group"

  cluster_name    = module.eks.cluster_name
  node_group_name = var.node_group_name
  instance_types  = var.instance_types
  min_size        = var.min_size
  max_size        = var.max_size
  desired_size    = var.desired_size
  environment     = var.environment
  subnet_ids      = module.vpc.private_subnets
}

module "iam" {
  source = "./modules/iam"

  node_role_name = module.node_group.node_role_name
}