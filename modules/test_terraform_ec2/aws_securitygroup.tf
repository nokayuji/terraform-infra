resource "aws_security_group" "terraform_ec2_sg" {
  name   = "${var.sys}-${var.env}-terrform-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["60.93.5.117/32"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.sys}-${var.env}-terrform-sg"
  }
}
