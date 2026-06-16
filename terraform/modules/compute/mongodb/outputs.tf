output "primary_private_ip" {
  value = aws_instance.mongodb_primary.private_ip
}

output "secondary1_private_ip" {
  value = aws_instance.mongodb_secondary1.private_ip
}

output "secondary2_private_ip" {
  value = aws_instance.mongodb_secondary2.private_ip
}
