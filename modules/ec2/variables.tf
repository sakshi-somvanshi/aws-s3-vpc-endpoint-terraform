variable "environment" {
  type        = string
  description = "this is for environment name"
}

variable "project_name" {
  type        = string
  description = "this is for project name"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "this is for instance type"
}

variable "subnet_id" {
  type        = string
  description = "this is for private subnet id"
}

variable "security_group_id" {
  type        = string
  description = "this is for security group id"
}

variable "instance_profile_name" {
  type        = string
  description = "this is for iam instance profile name"
}