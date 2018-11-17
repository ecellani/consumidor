##
# RDS instance resources
#
# Provides an RDS instance resource. A DB instance is an isolated database environment in the cloud. A DB instance can
# contain multiple user-created databases.
##

resource "aws_db_instance" "base-a" {
  depends_on             = ["aws_security_group.sgdb"]
  identifier             = "${var.identifier}"
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  skip_final_snapshot    = true
}
