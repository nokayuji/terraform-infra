#インターネットに接続するためにインターネットゲートウェイを設置する
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    #igw name
    Name = "${var.sys}-${var.env}-terraform-dev-igw"
  }
}
