#ap-northeast-1aにまたがるパブリックサブネット
resource "aws_subnet" "dev_pub_subnet_1a" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.cidr_sunet_block_public_a
  availability_zone = var.az_a

  tags = {
    #サブネットname
    Name = "${var.sys}-${var.env}-terraform-infra-public-subnet1a"
  }
}

#ap-northeast-1cにまたがるパブリックサブネット
resource "aws_subnet" "dev_pub_subnet_2c" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.cidr_sunet_block_public_c
  availability_zone = var.az_c

  tags = {
    #サブネットname
    Name = "${var.sys}-${var.env}-terraform-infra-public-subnet1c"
  }
}

# #ap-northeast-1aにまたがるプライベートサブネット
# resource "aws_subnet" "dev_pri_subnet_1a" {
#   vpc_id            = aws_vpc.dev_vpc.id
#   cidr_block        = var.cidr_sunet_block_private_a
#   availability_zone = var.az_a

#   tags = {
#     #サブネットname
#     Name = "${var.sys}-${var.env}-terraform-infra-private-subnet1a"
#   }
# }

# #ap-northeast-1cにまたがるプライベートサブネット
# resource "aws_subnet" "dev_pri_subnet_2c" {
#   vpc_id            = aws_vpc.dev_vpc.id
#   cidr_block        = var.cidr_sunet_block_private_c
#   availability_zone = var.az_c

#   tags = {
#     #サブネットname
#     Name = "${var.sys}-${var.env}-terraform-infra-private-subnet2c"
#   }
# }

