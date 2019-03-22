variable ami {}
variable subnet_id {}
variable vpc_security_group_id {}
variable identity {}
variable instance_type {}

resource "aws_instance" web {
  instance_type          = "${var.instance_type}"
  ami                    = "${var.ami}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]

  tags {
    Identity = "${var.identity}"
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}
