resource "aws_instance" "self_host_ec2" {
  count = var.runner_ec2_create_flag ? 1 : 0

  ami                         = data.aws_ami.amazon_linux_2023.id
  subnet_id                   = var.public_subnet_ids
  instance_type               = var.runner_ec2_instance_type
  key_name                    = aws_key_pair.self_host_ec2.key_name
  associate_public_ip_address = true
  iam_instance_profile        = data.aws_iam_instance_profile.runner_ec2_profile.name
  user_data = templatefile("${path.module}/userdata.sh", {
    ssm_path = "/github/token"
    region   = "ap-northeast-1"
    repo_url = "https://github.com/Terraform-TEST0928/terraform-infra"
  })

  vpc_security_group_ids = [
    aws_security_group.runner_ec2_sg.id
  ]

  root_block_device {
    volume_type = "gp3"
    volume_size = var.runner_ec2_volume_size
    encrypted   = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "self-hosted-runner"
  }

}

resource "tls_private_key" "self_host_ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "self_host_ec2" {
  key_name   = "${var.sys}-${var.env}-runner-ec2"
  public_key = tls_private_key.self_host_ec2.public_key_openssh
}

resource "local_file" "self_host_ec2_key" {
  content         = tls_private_key.self_host_ec2.private_key_pem
  filename        = "${path.module}/../../env/dev/${var.sys}-${var.env}-runner-ec2.pem"
  file_permission = "0400" #所有者のみ読み取り可能
}
