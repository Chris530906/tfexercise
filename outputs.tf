
output "public_ip" {
  value = aws_instance.foo.public_ip
  sensitive = true
}

output "public_dns" {
  value = aws_instance.foo.public_dns
  sensitive = true
}