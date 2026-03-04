output "instance_id" {
  value = aws_instance.directus_server.id
}

output "public_ip" {
  value = aws_instance.directus_server.public_ip
}

output "directus_url" {
  value = "http://${aws_instance.directus_server.public_ip}"
}