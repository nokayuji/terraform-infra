
# data "aws_vpc" "vpc_id" {
#   id = var.vpc_id
#   filter {
#     name   = "tag:Name"
#     values = ["${var.sys}-${var.env}-terraform-infra-vpc"]
#   }
# }

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Name = var.subnet_tag
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value

}
