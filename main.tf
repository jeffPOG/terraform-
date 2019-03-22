variable ami {}
variable subnet_id {}
variable vpc_security_group_id {}
variable identity {}
variable instance_type {}
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "server" {
  source                = "./server"
  ami                   = "${var.ami}"
  subnet_id             = "${var.subnet_id}"
  vpc_security_group_id = "${var.vpc_security_group_id}"
  identity              = "${var.identity}"
  instance_type         = "${var.instance_type}"
}

output "public_ip" {
  value = "${module.server.public_ip}"
}

#output "public_dns" {
#  value = "${aws_instance.web.public_dns}"
#}

