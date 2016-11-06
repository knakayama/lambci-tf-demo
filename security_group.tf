resource "aws_security_group" "bastion" {
  name        = "${var.name}-bastion-sg"
  vpc_id      = "${aws_vpc.vpc.id}"
  description = "${var.name} bastion sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-bastion-sg"
  }
}
