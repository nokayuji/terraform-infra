# #パブリックnat用のelastic ipアドレス
# resource "aws_eip" "nat" {
#   vpc = true
# }

# #パブリックnatゲートウェイ
# resource "aws_nat_gateway" "public" {
#   allocation_id = aws_eip.nat.id
#   #配置するパブリックサブネット
#   subnet_id = aws_subnet.dev_pub_subnet_1a.id

#   tags = {
#     #nat name
#     Name = "dev-nat-gateway"
#   }
# }
