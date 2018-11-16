##
# Security Groups
#
# This resource can prove useful when a module accepts a Security Group id as an input variable and needs to, for
# example, determine the id of the VPC that the security group belongs to.
##

# Security Group for Web (public subnet)
resource "aws_security_group" "sgweb" {
  name = "vpc_challenge_web"
  description = "Allow HTTP connection and SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id="${aws_vpc.default.id}"
  tags {
    Name = "Security Group Web"
  }
}

# Security Group for (private subnet)
resource "aws_security_group" "sgdb" {
  name = "sg_challenge_web"
  description = "Allow traffic only from public subnet"
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "Security Group DataBases"
  }
}
