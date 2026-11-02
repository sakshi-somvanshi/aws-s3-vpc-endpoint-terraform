variable "environment" {
  type        = string
  description = "this is for environment name"
}

variable "project_name" {
  type        = string
  description = "this is for project name"
}

variable "bucket_name" {
  type        = string
  description = "this is for s3 bucket name"
}

variable "vpc_endpoint_id" {
  type        = string
  description = "this is for s3 gateway vpc endpoint id"
}