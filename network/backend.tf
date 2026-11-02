terraform {
  backend "s3" {
    bucket ="terraform-remote-backend-fct-batch"
    key    = "network/vpc-endpoints-demo/terraform.tfstate"
    region = "ap-south-1"
  }
}