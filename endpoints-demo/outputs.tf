output "bucket_name" {
  value = module.s3.bucket_name
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "private_ip" {
  value = module.ec2.private_ip
}

output "test_file" {
  value = module.s3.test_file
}