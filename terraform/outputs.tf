output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.devops_user.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.devops_user.id
}

output "directus_url" {
  description = "Directus application URL"
  value       = "http://${aws_instance.devops_user.public_ip}"
}
