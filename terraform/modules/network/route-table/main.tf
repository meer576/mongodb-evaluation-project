resource "aws_route_table" "public_rt" {

  vpc_id = var.vpc_id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = var.igw_id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private_rt" {

  vpc_id = var.vpc_id

  route {

    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "primary_assoc" {

  subnet_id      = var.private_primary_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "secondary1_assoc" {

  subnet_id      = var.private_secondary1_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "secondary2_assoc" {

  subnet_id      = var.private_secondary2_subnet_id
  route_table_id = aws_route_table.private_rt.id
}
