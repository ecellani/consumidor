##
# VPC
#
# This resource can prove useful when a module accepts a vpc id as an input variable and needs to, for example,
# determine the CIDR block of that VPC.
##
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "challenge-vpc"
  }
}

##
# Elastic IP
#
# Provides an Elastic IP resource
##
resource "aws_eip" "eip" {
  vpc      = true
}

##
# Network Address translation
#
# Provides details about a specific Nat Gateway
##
resource "aws_nat_gateway" "public-nat" {
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
    depends_on = ["aws_internet_gateway.gw"]
}

##
# Internet Gateway
#
# Provides a resource to create a VPC Internet Gateway
##
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "VPC Internet Gateway"
  }
}

##
# Route Table
#
# This resource can prove useful when a module accepts a Subnet id as an input variable and needs to, for example, add
# a route in the Route Table.
##

# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Public Subnet Route Table"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}
