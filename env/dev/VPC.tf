module "VPC" {
  source = "../../modules/VPC"

  sys                       = var.sys
  env                       = var.env
  az_a                      = var.az_a
  az_c                      = var.az_c
  az_d                      = var.az_d
  cidr_block                = var.cidr_block
  cidr_sunet_block_public_a = var.cidr_sunet_block_public_a
  cidr_sunet_block_public_c = var.cidr_sunet_block_public_c
  # cidr_sunet_block_private_a = var.cidr_sunet_block_private_a
  # cidr_sunet_block_private_c = var.cidr_sunet_block_private_c
  cidr_rt_block = var.cidr_rt_block
  #   subnet_tag                 = var.subnet_tag.private
  vpc_id = var.vpc_id
}

# module "VPC_public_subnet" {
#   source = "../modules/VPC"

#   sys                        = var.sys
#   env                        = var.env
#   az_a                       = var.az_a
#   az_c                       = var.az_c
#   az_d                       = var.az_d
#   cidr_block                 = var.cidr_block
#   cidr_sunet_block_public_a  = var.cidr_sunet_block_public_a
#   cidr_sunet_block_public_c  = var.cidr_sunet_block_public_c
#   cidr_sunet_block_private_a = var.cidr_sunet_block_private_a
#   cidr_sunet_block_private_c = var.cidr_sunet_block_private_c
#   cidr_rt_block              = var.cidr_rt_block
#   subnet_tag                 = var.subnet_tag.public
#   vpc_id                     = var.vpc_id
# }
