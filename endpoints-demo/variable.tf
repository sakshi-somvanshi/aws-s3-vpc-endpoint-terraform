variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "this is for aws region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "this is for environment name"
}

variable "project_name" {
  type        = string
  description = "this is for project name"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is for vpc cidr block"
}

variable "bucket_name" {
  type        = string
  description = "this is for s3 bucket name"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "this is for instance type"
}