output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_primary_subnet_id" {
  value = aws_subnet.private_primary.id
}

output "private_secondary1_subnet_id" {
  value = aws_subnet.private_secondary1.id
}

output "private_secondary2_subnet_id" {
  value = aws_subnet.private_secondary2.id
}
