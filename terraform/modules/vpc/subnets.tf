resource "aws_subnet" "public_subnet" {
  vpc_id			= aws_vpc.teamcity_vpc.id
  cidr_block			= var.public_cidr
  map_public_ip_on_launch	= "true"
  availability_zone		= "us-east-2a"

  tags = {
    Name          = "public_subnet"
    Created_by    = "terraform"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                        = aws_vpc.teamcity_vpc.id
  cidr_block                    = var.private_cidr
  map_public_ip_on_launch       = "false"
  availability_zone             = "us-east-2b"

  tags = {
    Name          = "private_subnet"
    Created_by    = "terraform"
  }
}

resource "aws_subnet" "public_access_private_subnet" {
  vpc_id                        = aws_vpc.teamcity_vpc.id
  cidr_block                    = var.public_private_cidr
  map_public_ip_on_launch       = "true"
  availability_zone             = "us-east-2b"

  tags = {
    Name          = "public_access_private_subnet"
    Created_by    = "terraform"
  }
}
