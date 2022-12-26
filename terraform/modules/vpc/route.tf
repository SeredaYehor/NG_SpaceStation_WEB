resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.teamcity_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name          = "public_route_table"
    Created_by    = "terraform"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id	 = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.teamcity_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name          = "private_route_table"
    Created_by    = "terraform"
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id         = aws_subnet.private_subnet.id
  route_table_id    = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "public_access_private_rta" {
  subnet_id      = aws_subnet.public_access_private_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
