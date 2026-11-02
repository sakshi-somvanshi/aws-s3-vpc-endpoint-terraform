##################################################
# SECURITY GROUP
##################################################

module "security_group" {
  source = "../../../modules/security-group"

  environment  = var.environment
  project_name = var.project_name
  vpc_id       = data.terraform_remote_state.network.outputs.vpc_id
  vpc_cidr     = var.vpc_cidr
}

##################################################
# IAM
##################################################

module "iam" {
  source = "../../../modules/iam"

  environment  = var.environment
  project_name = var.project_name
  bucket_name  = var.bucket_name
}

##################################################
# S3
##################################################

module "s3" {
  source = "../../../modules/s3"

  environment     = var.environment
  project_name    = var.project_name
  bucket_name     = var.bucket_name
  vpc_endpoint_id = data.terraform_remote_state.network.outputs.s3_endpoint_id
}

##################################################
# ENDPOINT POLICY
##################################################

module "endpoint_policy" {
  source = "../../../modules/endpoint-policy"

  vpc_endpoint_id = data.terraform_remote_state.network.outputs.s3_endpoint_id
  bucket_name     = var.bucket_name
}

##################################################
# EC2
##################################################

module "ec2" {
  source = "../../../modules/ec2"

  environment           = var.environment
  project_name          = var.project_name
  instance_type         = var.instance_type
  subnet_id             = data.terraform_remote_state.network.outputs.private_subnet_ids[0]
  security_group_id     = module.security_group.private_ec2_sg_id
  instance_profile_name = module.iam.instance_profile_name
}