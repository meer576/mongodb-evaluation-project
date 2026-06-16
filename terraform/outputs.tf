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



output "terraform_state_bucket" {
  value = module.backend.bucket_name
}

output "terraform_lock_table" {
  value = module.backend.dynamodb_table_name
}

output "mongodb_backup_bucket" {
  value = module.backup_s3.backup_bucket_name
}
