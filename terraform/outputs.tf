output "public_ip" {
  value = aws_instance.devops_user.public_ip
}

output "instance_id" {
  value = aws_instance.devops_user.id
}

output "directus_url" {
  value = "http://${aws_instance.devops_user.public_ip}"
}
