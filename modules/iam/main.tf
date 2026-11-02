##################################################
# EC2 IAM ROLE
##################################################

resource "aws_iam_role" "ec2" {
  name = "${var.environment}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.environment}-ec2-ssm-role"
  }
}

##################################################
# SSM ACCESS (SESSION MANAGER)
##################################################

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

##################################################
# S3 READ ACCESS (LEAST PRIVILEGE)
##################################################

resource "aws_iam_role_policy" "s3_read" {
  name = "${var.environment}-s3-read"
  role = aws_iam_role.ec2.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = "arn:aws:s3:::${var.bucket_name}"
      },
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

##################################################
# INSTANCE PROFILE
##################################################

resource "aws_iam_instance_profile" "ec2" {
  name = "${var.environment}-ec2-ssm-profile"
  role = aws_iam_role.ec2.name
}