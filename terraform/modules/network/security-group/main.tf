resource "aws_security_group" "bastion_sg" {

  name        = "bastion-sg"
  description = "Bastion Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "bastion-sg"
  }
}



resource "aws_security_group" "mongodb_sg" {

  name        = "mongodb-sg"
  description = "MongoDB Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "MongoDB"

    from_port = 27017
    to_port   = 27017
    protocol  = "tcp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  ingress {

    description = "SSH from Bastion"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = [
      aws_security_group.bastion_sg.id
    ]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "mongodb-sg"
  }
}
