output "address" {
  value = "${aws_instance.wb.public_dns}"
}
