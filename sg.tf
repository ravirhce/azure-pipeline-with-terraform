locals {
  inbound_port = [22,80,443]
  outbound_ports = [0]
}

resource "aws_security_group" "webport" {
  name        = "webserv-${random_pet.random.id}"
  description = "Allow webserver inbound traffic"
  #vpc_id      = "${aws_vpc.main.id}"
  dynamic "ingress" {
    for_each = local.inbound_port
    content {
      from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
    to_port     = egress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
  }
  
}