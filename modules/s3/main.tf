##################################################
# S3 BUCKET
##################################################

resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

##################################################
# BLOCK PUBLIC ACCESS
##################################################

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

##################################################
# BUCKET POLICY
##################################################

resource "aws_s3_bucket_policy" "this" {
  bucket     = aws_s3_bucket.private_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.this]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyInsecureTransport"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.private_bucket.arn,
          "${aws_s3_bucket.private_bucket.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
      {
        Sid       = "EC2RoleOnlyViaVpcEndpoint"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.private_bucket.arn,
          "${aws_s3_bucket.private_bucket.arn}/*"
        ]
        Condition = {
          StringLike = {
            "aws:PrincipalArn" = "arn:aws:iam::*:role/${var.environment}-ec2-ssm-role"
          }
          StringNotEquals = {
            "aws:SourceVpce" = var.vpc_endpoint_id
          }
        }
      }
    ]
  })
}

##################################################
# DEMO FILE
##################################################

resource "aws_s3_object" "test_file" {
  bucket = aws_s3_bucket.private_bucket.id
  key    = "test.txt"

  content = <<EOF
Hello from Private EC2 via VPC Endpoint

This file was uploaded using Terraform.

Environment: ${var.environment}
EOF

  content_type = "text/plain"
}