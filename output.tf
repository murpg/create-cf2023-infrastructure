output "ec2_ipv4_address" {
  value = "http://${aws_instance.web.public_ip}"
}

output "ssh_connection" {
  value = "ubuntu@${aws_instance.web.public_dns}"
}

output "ssh_private_key" {
  value     = tls_private_key.key.private_key_openssh
  sensitive = true
}
