##################################################
# NETWORK REMOTE STATE
##################################################

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-remote-backend-fct-batch"
    key    = "network/vpc-endpoints-demo/terraform.tfstate"
    region = "ap-south-1"
  }
}