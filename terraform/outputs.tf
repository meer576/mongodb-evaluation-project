output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "mongodb_primary_private_ip" {
  value = module.mongodb.primary_private_ip
}

output "mongodb_secondary1_private_ip" {
  value = module.mongodb.secondary1_private_ip
}

output "mongodb_secondary2_private_ip" {
  value = module.mongodb.secondary2_private_ip
}



