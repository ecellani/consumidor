##
# Subnet
#
# This resource can prove useful when a module accepts a subnet id as an input variable and needs to, for example,
# determine the id of the VPC that the subnet belongs to.
##

# Public subnet for Web
resource "aws_subnet" "public-subnet-a" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "Web Public Subnet A"
  }
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_b_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "Web Public Subnet B"
  }
}

# Private subnet for Databases
resource "aws_subnet" "private-subnet-a" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "Database Private Subnet A"
  }
}

resource "aws_subnet" "private-subnet-b" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "Database Private Subnet B"
  }
}

# RDS DB subnet group resource
resource "aws_db_subnet_group" "default" {
  name        = "db_subnet_group"
  description = "RDS DB subnet group resource"
  subnet_ids  = ["${aws_subnet.private-subnet-a.id}", "${aws_subnet.private-subnet-b.id}"]
}
