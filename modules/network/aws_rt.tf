#パブリックルートテーブル
resource "aws_route_table" "dev_pub_rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = var.cidr_rt_block
    #パブリックサブネットに紐付けるrtのためigwを関連づける
    gateway_id = aws_internet_gateway.dev_igw.id
  }
  tags = {
    #rt name
    Name = "${var.sys}-${var.env}-terraform-dev-pub-rt"
  }
}

#パブリックSubnet用のRoute table関連付け
resource "aws_route_table_association" "dev_pub_rt_associate_1a" {
  subnet_id      = aws_subnet.dev_pub_subnet_1a.id
  route_table_id = aws_route_table.dev_pub_rt.id
}
resource "aws_route_table_association" "dev_pub_rt_associate_2c" {
  subnet_id      = aws_subnet.dev_pub_subnet_2c.id
  route_table_id = aws_route_table.dev_pub_rt.id
}

# #プライベートルートテーブル
# resource "aws_route_table" "dev_pri_rt" {
#   vpc_id = aws_vpc.dev_vpc.id
#   route {
#     cidr_block = var.cidr_rt_block
#     #プライベートサブネットに紐付けるrtのためnatgwを関連づける
#     # nat_gateway_id = aws_nat_gateway.public.id
#   }
#   tags = {
#     #rt name
#     Name = "${var.sys}-${var.env}-terraform-dev-pri-rt"
#   }
# }

# #プライベートSubnet用のRoute table関連付け
# resource "aws_route_table_association" "dev_pri_rt_associate_1c" {
#   subnet_id      = aws_subnet.dev_pri_subnet_1a.id
#   route_table_id = aws_route_table.dev_pri_rt.id
# }
# resource "aws_route_table_association" "dev_pri_rt_associate_2c" {
#   subnet_id      = aws_subnet.dev_pri_subnet_2c.id
#   route_table_id = aws_route_table.dev_pri_rt.id
# }
