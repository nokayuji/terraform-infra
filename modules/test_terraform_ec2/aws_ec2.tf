resource "aws_instance" "ec2" {
  count = var.ec2_create_flag ? 1 : 0

  ami                         = "ami-0ca38c7440de1749aa"
  instance_type               = var.terraform_ec2_instance_type
  key_name                    = aws_key_pair.ec2.key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.terraform_ec2_profile.name
  user_data                   = <<-EOF
    #!/bin/bash
    set -eux

    dnf -y update
    dnf install -y git
    git version
    git clone https://github.com/tfutils/tfenv.git /home/ec2-user/.tfenv
    echo $PATH
    sudo ln -s /home/ec2-user/.tfenv/bin/* /usr/local/bin/
    chown -R ec2-user:ec2-user /home/ec2-user/.tfenv
    sudo -u ec2-user /home/ec2-user/.tfenv/bin/tfenv install 1.5.7
    sudo -u ec2-user /home/ec2-user/.tfenv/bin/tfenv use 1.5.7
    tfenv -v
    terraform -v
    sudo -u ec2-user git clone https://github.com/Terraform-TEST0928/terraform-infra.git /home/ec2-user/terraform-infra
    pwd
  EOF

  vpc_security_group_ids = [
    aws_security_group.terraform_ec2_sg.id
  ]

  root_block_device {
    volume_type = "gp3"
    volume_size = var.terraform_ec2_volume_size
    encrypted   = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.sys}-${var.env}-terrform-ec2"
  }

}

resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  key_name   = "${var.sys}-${var.env}-terraform-ec2"
  public_key = tls_private_key.ec2.public_key_openssh
}

# resource "local_file" "private_key" {
#   content         = tls_private_key.ec2.private_key_pem
#   filename        = "${path.module}/../../env/dev/${var.sys}-${var.env}-ec2.pem"
#   file_permission = "0400" #所有者のみ読み取り可能
# }
