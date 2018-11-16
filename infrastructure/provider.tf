##
# AWS Provider
#
# The Amazon Web Services (AWS) provider is used to interact with the many resources supported by AWS. The provider
# needs to be configured with the proper credentials before it can be used.
##

provider "aws" {
  region = "${var.aws_region}"
}
