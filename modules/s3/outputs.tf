output "bucket_name" {
  value = aws_s3_bucket.private_bucket.bucket
}

output "test_file" {
  value = aws_s3_object.test_file.key
}