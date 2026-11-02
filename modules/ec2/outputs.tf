output "instance_id" {
  value = aws_instance.private.id
}

output "private_ip" {
  value = aws_instance.private.private_ip
}