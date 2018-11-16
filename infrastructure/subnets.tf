##
# Subnet
#
# This resource can prove useful when a module accepts a subnet id as an input variable and needs to, for example,
# determine the id of the VPC that the subnet belongs to.
##

# Public subnet for Web
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "Web Public Subnet"
  }
}

# Private subnet for Databases
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1b"

  tags {
    Name = "Database Private Subnet"
  }
}

# RDS DB subnet group resource
resource "aws_db_subnet_group" "default" {
  name        = "db_subnet_group"
  description = "RDS DB subnet group resource"
  subnet_ids  = ["${aws_subnet.private-subnet.id}", "${aws_subnet.public-subnet.id}"]
}
