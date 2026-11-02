##################################################
# VPC MODULE
##################################################

module "vpc" {
  source = "../../../modules/vpc"

  ##################################################
  # ENVIRONMENT
  ##################################################

  environment  = var.environment
  project_name = var.project_name

  ##################################################
  # REGION
  ##################################################

  aws_region = var.aws_region

  ##################################################
  # NETWORK
  ##################################################

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}