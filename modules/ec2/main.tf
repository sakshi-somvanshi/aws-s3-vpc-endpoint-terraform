##################################################
# AMAZON LINUX 2023 AMI
##################################################

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

##################################################
# PRIVATE EC2 INSTANCE
##################################################

resource "aws_instance" "private" {
  ami                         = data.aws_ssm_parameter.al2023.value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = false
  user_data                   = file("${path.module}/userdata.sh")

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.environment}-private-ec2"
  }
}