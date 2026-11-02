##################################################
# LOCAL TAGS
##################################################

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}

##################################################
# PRIVATE EC2 SECURITY GROUP
##################################################

resource "aws_security_group" "private_ec2" {
  name        = "${var.environment}-private-ec2-sg"
  description = "Private EC2 Security Group"
  vpc_id      = var.vpc_id

  # No inbound rules: access is only through SSM Session Manager.

  egress {
    description = "HTTPS outbound to VPC endpoints"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-private-ec2-sg"
    }
  )
}