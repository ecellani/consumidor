##
# Variables
#
# Parameters for a Terraform module
##

variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC Classless Inter-Daomin Routing"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private Subnet"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Linux AMI"
  default = "ami-0ac019f4fcb7cb7e6"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/id_rsa.pub"
}

##
# RDS
##
variable "identifier" {
  default     = "rds-base-a"
  description = "Identifier for your DB"
}

variable "storage" {
  default     = "5"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "postgres"
  description = "Engine postgres"
}

variable "engine_version" {
  description = "Engine version"
  default = {
    postgres = "9.6.8"
  }
}

variable "instance_class" {
  default = "db.t2.micro"
  description = "Instance class"
}

variable "db_name" {
  default = "baseA"
  description = "db name"
}

variable "username" {
  default = "root"
  description = "User name"
}

variable "password" {
  description = "password, provide through ENV variables"
}
