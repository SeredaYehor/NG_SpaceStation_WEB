resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name          = "nat"
    Created_by    = "terraform"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id	= aws_subnet.public_subnet.id
  depends_on	= [aws_internet_gateway.internet_gw]

  tags = {
    Name          = "nat_gateway"
    Created_by    = "terraform"
  }
}

