output "instance_public_ip" {
  value = aws_instance.directus_vm.public_ip
}

output "instance_id" {
  value = aws_instance.directus_vm.id
}

output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "directus_url" {
  value = "http://${aws_instance.directus_vm.public_ip}:8055"
}
