variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "mongodb-vpc"
}


#=========subnet variables====


variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_primary_cidr" {
  default = "10.0.2.0/24"
}

variable "private_secondary1_cidr" {
  default = "10.0.3.0/24"
}

variable "private_secondary2_cidr" {
  default = "10.0.4.0/24"
}

variable "az1" {
  default = "ap-south-1a"
}

variable "az2" {
  default = "ap-south-1b"
}

variable "az3" {
  default = "ap-south-1c"
}




#========bastion host variables==========


variable "ubuntu_ami" {
  default = "ami-0388e3ada3d9812da"
}

variable "instance_type_bastion" {
  default = "t3.micro"
}

variable "key_name" {
  default = "mongodb-key"
}





variable "instance_type_mongo" {
  default = "t3.micro"
}




#===============S3 Bucket variables===========


variable "terraform_state_bucket" {
  default = "mongodb-tfstate-726271906433"
}

variable "terraform_lock_table" {
  default = "terraform-state-lock"
}

variable "mongodb_backup_bucket_prefix" {
  default = "mongodb-backup"
}
