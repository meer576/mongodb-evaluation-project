module "vpc" {

  source = "./modules/network/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}



module "subnet" {

  source = "./modules/network/subnet"

  vpc_id = module.vpc.vpc_id

  public_subnet_cidr     = var.public_subnet_cidr
  private_primary_cidr   = var.private_primary_cidr
  private_secondary1_cidr = var.private_secondary1_cidr
  private_secondary2_cidr   = var.private_secondary2_cidr

  az1 = var.az1
  az2 = var.az2
  az3 = var.az3
}



module "internet_gateway" {

  source = "./modules/network/internet-gateway"

  vpc_id = module.vpc.vpc_id
}



module "nat_gateway" {

  source = "./modules/network/nat-gateway"

  public_subnet_id = module.subnet.public_subnet_id

  igw_id = module.internet_gateway.igw_id
}


module "route_table" {

  source = "./modules/network/route-table"

  vpc_id = module.vpc.vpc_id

  igw_id = module.internet_gateway.igw_id

  nat_gateway_id = module.nat_gateway.nat_gateway_id

  public_subnet_id = module.subnet.public_subnet_id

  private_primary_subnet_id = module.subnet.private_primary_subnet_id

  private_secondary1_subnet_id = module.subnet.private_secondary1_subnet_id

  private_secondary2_subnet_id = module.subnet.private_secondary2_subnet_id
}



module "security_group" {

  source = "./modules/network/security-group"

  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}



module "bastion" {

  source = "./modules/compute/bastion"

  ami_id = var.ubuntu_ami

  instance_type = var.instance_type_bastion

  key_name = var.key_name

  subnet_id = module.subnet.public_subnet_id

  security_group_id = module.security_group.bastion_sg_id
}



module "mongodb" {

  source = "./modules/compute/mongodb"

  ami_id = var.ubuntu_ami

  instance_type_mongo = var.instance_type_mongo

  key_name = var.key_name

  mongodb_sg_id = module.security_group.mongodb_sg_id

  primary_subnet_id = module.subnet.private_primary_subnet_id

  secondary1_subnet_id = module.subnet.private_secondary1_subnet_id

  secondary2_subnet_id = module.subnet.private_secondary2_subnet_id
}






module "backend" {

  source = "./modules/storage/backend"

  bucket_name = var.terraform_state_bucket

  dynamodb_table_name = var.terraform_lock_table
}



module "backup_s3" {

  source = "./modules/storage/backup-s3"

  bucket_prefix = var.mongodb_backup_bucket_prefix
}
