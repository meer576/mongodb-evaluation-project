resource "aws_subnet" "public" {

  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_primary" {

  vpc_id            = var.vpc_id
  cidr_block        = var.private_primary_cidr
  availability_zone = var.az1

  tags = {
    Name = "mongodb-primary-subnet"
  }
}

resource "aws_subnet" "private_secondary1" {

  vpc_id            = var.vpc_id
  cidr_block        = var.private_secondary1_cidr
  availability_zone = var.az2

  tags = {
    Name = "mongodb-secondary1-subnet"
  }
}

resource "aws_subnet" "private_secondary2" {

  vpc_id            = var.vpc_id
  cidr_block        = var.private_secondary2_cidr
  availability_zone = var.az3

  tags = {
    Name = "mongodb-secondary2-subnet"
  }
}
