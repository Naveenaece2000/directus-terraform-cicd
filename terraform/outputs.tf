output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.devops_user.id
}

output "public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.devops_user.public_ip
}

output "directus_url" {
  description = "Directus Application URL"
  value       = "http://${aws_instance.devops_user.public_ip}"
}
