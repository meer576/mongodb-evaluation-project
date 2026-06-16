resource "aws_instance" "mongodb_primary" {

  ami           = var.ami_id
  instance_type = var.instance_type_mongo

  key_name = var.key_name

  subnet_id = var.primary_subnet_id

  vpc_security_group_ids = [
    var.mongodb_sg_id
  ]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "mongodb-primary"
  }
}


resource "aws_instance" "mongodb_secondary1" {

  ami           = var.ami_id
  instance_type = var.instance_type_mongo

  key_name = var.key_name

  subnet_id = var.secondary1_subnet_id

  vpc_security_group_ids = [
    var.mongodb_sg_id
  ]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "mongodb-secondary1"
  }
}






resource "aws_instance" "mongodb_secondary2" {

  ami           = var.ami_id
  instance_type = var.instance_type_mongo

  key_name = var.key_name

  subnet_id = var.secondary2_subnet_id

  vpc_security_group_ids = [
    var.mongodb_sg_id
  ]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "mongodb-secondary2"
  }
}
