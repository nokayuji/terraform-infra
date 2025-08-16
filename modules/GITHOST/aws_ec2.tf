resource "aws_instance" "public" {
  ami           = var.ami_id #ami-0c1de55b79f5aff9b インスタンスに使用するAMI
  instance_type = var.instance_type
  #  associate_public_ip_address = var.associate_public_ip_address #パブリックIPアドレスをVPC内のインスタンスに関連付けるかどうか
  availability_zone       = var.availability_zone
  disable_api_termination = var.disable_api_termination #trueの場合、EC2インスタンス終了保護を有効
  ebs_block_device {
    device_name = "/${var.env}/sda1"
    iops        = 3000
    volume_type = "gp3"
    throughput  = 125
  }
  iam_instance_profile = aws_iam_instance_profile.ec2_public.name #EC2に割り当てるIAMロール
  key_name             = aws_key_pair.ec2.key_name                #インスタンスに使用するキーペアのキー名
  security_groups      = [aws_security_group.aws_ec2_public.id]   #EC2に紐づけるセキュリティグループ
  subnet_id            = var.subnet_id                            #起動するVPCサブネットID
  tags = {
    Name = "${var.env}-ec2-public"
  }
}

resource "aws_key_pair" "ec2" {
  key_name   = "Amazon-Linux-001"
  public_key = tls_private_key.ec2.public_key_openssh
}

resource "tls_private_key" "ec2" {
  algorithm = "RSA"
}

resource "aws_eip" "public" {
  instance = aws_instance.public.id
  vpc      = true
}
