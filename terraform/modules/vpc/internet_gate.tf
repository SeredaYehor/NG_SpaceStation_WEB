resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.teamcity_vpc.id

  tags = {
    Name          = "internet_gateway"
    Created_by    = "terraform"
  }
}

