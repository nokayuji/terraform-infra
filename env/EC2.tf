#module "EC2" {
#   source = "../modules/EC2"

#   sys           = var.sys
#   env           = var.env
#   vpc_id        = module.VPC.vpc_id
#   instance_type = var.instance_type
#   subnet_id_1a  = module.VPC.private_subnet_ids
#   subnet_id_1c  = module.VPC.private_subnet_ids_2
# }
