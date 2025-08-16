resource "aws_instance" "ec2" {
  for_each = local.ec2_instances

  ami                     = data.aws_ami.amazon_linux_2023.id
  instance_type           = each.value.instance_type
  subnet_id               = each.value.subnet_id
  disable_api_termination = true
  key_name                = aws_key_pair.ec2.key_name
  iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name

  vpc_security_group_ids = concat(
    aws_security_group.ec2_zabbix.id,
    aws_security_group.ec2_test1.id,
    lookup(each.value.sg_group, each.key, [])
  )

  root_block_device {
    volume_type           = "gp3"
    volume_size           = each.value.ebs_volume_size
    delete_on_termination = true
    iops                  = 1000
    throughput            = 125
  }

  tags = {
    Name = "${var.sys}-${var.env}-${each.key}"
  }

}

resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  key_name   = "${var.sys}-${var.env}-ec2"
  public_key = tls_private_key.ec2.private_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.ec2.private_key_pem
  filename        = "${path.module}/${var.sys}-${var.env}-ec2-key.pem"
  file_permission = "0400" #所有者のみ読み取り可能
}
