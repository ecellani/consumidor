##
# EC2 key pair
#
# Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances.
##
resource "aws_key_pair" "default" {
  key_name = "vpckeypair"
  public_key = "${file("${var.key_path}")}"
}

# Apache Server - public
resource "aws_instance" "wb" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install.sh")}"
  tags {
    Name = "webserver"
  }
}

# # Database - subnet
# resource "aws_instance" "db" {
#    ami  = "${var.ami}"
#    instance_type = "t1.micro"
#    key_name = "${aws_key_pair.default.id}"
#    subnet_id = "${aws_subnet.private-subnet.id}"
#    vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
#    source_dest_check = false
#   tags {
#     Name = "database"
#   }
# }
