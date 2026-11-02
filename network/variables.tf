variable "environment" {
  type        = string
  description = "this is for environment name"
}

variable "project_name" {
  type        = string
  description = "this is for project name"
}

variable "aws_region" {
  type        = string
  description = "this is for aws region"
}

variable "vpc_cidr" {
  type        = string
  description = "this is for vpc cidr block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "this is for public subnet cidrs"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "this is for private subnet cidrs"
}

variable "availability_zones" {
  type        = list(string)
  description = "this is for availability zones"
}