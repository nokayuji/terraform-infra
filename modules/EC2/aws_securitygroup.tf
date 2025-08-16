resource "aws_security_group" "ec2_sg" {
  name        = "${var.sys}-${var.env}-ec2"
  description = "ec2 sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["162.120.185.16/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.sys}-${var.env}-ec2-sg"
  }
}

resource "aws_security_group" "ec2_zabbix" {
  name   = "${var.sys}-${var.env}-ec2-zabbix"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "ec2_test1" {
  name   = "${var.sys}-${var.env}-ec2-test1"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "ec2_test2" {
  name   = "${var.sys}-${var.env}-ec2-test2"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "ec2_test3" {
  name   = "${var.sys}-${var.env}-ec2-test3"
  vpc_id = var.vpc_id
}
