##################################################
# S3 GATEWAY ENDPOINT POLICY
##################################################

resource "aws_vpc_endpoint_policy" "s3" {
  vpc_endpoint_id = var.vpc_endpoint_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowOnlyDemoBucket"
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}